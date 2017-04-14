;; Code for CS61A project 2 -- picture language

(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
	(beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
	(below painter (beside smaller smaller)))))


(define (split major minor)
  (define (internal-split painter n)
    (if (= n 0)
	painter
	(let ((smaller (internal-split painter (- n 1))))
	  (major painter (minor smaller smaller)))))
  internal-split
    )
  

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
	    (right (right-split painter (- n 1))))
	(let ((top-left (beside up up))
	      (bottom-right (below right right))
	      (corner (corner-split painter (- n 1))))
	  (beside (below painter top-left)
		  (below bottom-right corner))))))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
	  (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (identity x) x)

(define (flipped-pairs painter)
  (let ((combine4 (square-of-four identity flip-vert
				  identity flip-vert)))
    (combine4 painter)))

;; or

; (define flipped-pairs
;   (square-of-four identity flip-vert identity flip-vert))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity
				  rotate180 flip-vert)))
    (combine4 (corner-split painter n))))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
			   (edge1-frame frame))
	       (scale-vect (ycor-vect v)
			   (edge2-frame frame))))))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
	((frame-coord-map frame) (start-segment segment))
	((frame-coord-map frame) (end-segment segment))))
     segment-list)))

(define (draw-line v1 v2)
  (penup)
  (setxy (- (* (xcor-vect v1) 200) 100)
	 (- (* (ycor-vect v1) 200) 100))
  (pendown)
  (setxy (- (* (xcor-vect v2) 200) 100)
	 (- (* (ycor-vect v2) 200) 100)))

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
	(painter
	 (make-frame new-origin
		     (sub-vect (m corner1) new-origin)
		     (sub-vect (m corner2) new-origin)))))))

(define (flip-vert painter)
  (transform-painter painter
		     (make-vect 0.0 1.0)
		     (make-vect 1.0 1.0)
		     (make-vect 0.0 0.0)))

(define (flip-horiz painter)
  (transform-painter painter
		     (make-vect 1 0)
		     (make-vect 0 0)
		     (make-vect 1 1)))

(define (shrink-to-upper-right painter)
  (transform-painter painter
		    (make-vect 0.5 0.5)
		    (make-vect 1.0 0.5)
		    (make-vect 0.5 1.0)))

(define (rotate90 painter)
  (transform-painter painter
		     (make-vect 1.0 0.0)
		     (make-vect 1.0 1.0)
		     (make-vect 0.0 0.0)))

(define (squash-inwards painter)
  (transform-painter painter
		     (make-vect 0.0 0.0)
		     (make-vect 0.65 0.35)
		     (make-vect 0.35 0.65)))

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
	   (transform-painter painter1
			      (make-vect 0.0 0.0)
			      split-point
			      (make-vect 0.0 1.0)))
	  (paint-right
	   (transform-painter painter2
			      split-point
			      (make-vect 1.0 0.0)
			      (make-vect 0.5 1.0))))
      (lambda (frame)
	(paint-left frame)
	(paint-right frame)))))



(define (below painter1 painter2)
  (let ((split-point (make-vect 0 0.5)))
    (let ((paint-bottom
	   (transform-painter painter1
			      (make-vect 0 0)
			      (make-vect 1 0)
			      split-point))
	  (paint-top
	    (transform-painter painter2
			       split-point
			       (make-vect 1 0.5)
			       (make-vect 0 1))))
	  (lambda (frame)
	    (paint-bottom frame)
	    (paint-top frame)))))
      

(define (below painter1 painter2)
  (flip-vert (rotate90 (beside (rotate90 painter1) (rotate90 painter2)))))

;;
;; Your code goes here
;;

(define make-vect cons)

(define xcor-vect car)

(define ycor-vect cdr)

(define (add-vect a b)
  (make-vect (+ (xcor-vect a) (xcor-vect b))
	     (+ (ycor-vect a) (ycor-vect b))))

(define (sub-vect a b)
  (make-vect (- (xcor-vect a) (xcor-vect b))
	     (- (ycor-vect a) (ycor-vect b))))

(define (scale-vect scalar vect)
  (make-vect (* scalar (xcor-vect vect))
	     (* scalar (ycor-vect vect))))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (list-ref frame 0))


(define (edge1-frame frame)
  (list-ref frame 1))

(define (edge2-frame frame)
  (list-ref frame 2))

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define normal-frame (make-frame (make-vect 0 0) (make-vect 1 0) (make-vect 0 1)))
(define top-left (make-vect 0 1))
(define top-right (make-vect 1 1))
(define bottom-right (make-vect 1 0))
(define bottom-left (make-vect 0 0))

(define mouth (list (make-segment
	       (make-vect (/ 1 6) (/ 1 3))
	       (make-vect (/ 5 6) (/ 1 3)))))

(define left-eye (list (make-segment
		  (make-vect (/ 1 6) (/ 2 3))
		  (make-vect (/ 2 6) (/ 2 3)))))

(define right-eye (list (make-segment
		  (make-vect (/ 4 6) (/ 2 3))
		  (make-vect (/ 5 6) (/ 2 3)))))


(define face-outline
		 (list
		  (make-segment bottom-left top-left)
		  (make-segment top-left top-right)
		  (make-segment top-right bottom-right)
		  (make-segment bottom-right bottom-left)))

(define draw-x (segments->painter
		(list
		 (make-segment bottom-left top-right)
		 (make-segment bottom-right top-left))))

(define draw-face (segments->painter
		    (append face-outline mouth left-eye right-eye)))

(define (line . points)
  (append (car points))



(define draw-wave (segments->painter
		   (list
		    (make-segment (make-vect 0 0.8) (make-vect 0.2 0.6))
		    (make-segment (make-vect 0.2 0.6) (make-vect 0.3 0.65))
		    (make-segment (make-vect 0.3 0) (make-vect 0 0))
		    (make-segment (make-vect 0 0) (make-vect 0 0))
		    (make-segment (make-vect 0 0) (make-vect 0 0))
		    (make-segment (make-vect 0 0) (make-vect 0 0))
		    (make-segment (make-vect 0 0) (make-vect 0 0)))))


;;(define (


;;(define full-frame (make-frame (make-vect -0.5 -0.5)
;;			       (make-vect 2 0)
;;			       (make-vect 0 2)))
