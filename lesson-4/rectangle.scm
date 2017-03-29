(load "./segments-and-points")

;; (define make-dimensions cons)

;; (define (dimensions rect)
;;   (cdr rect))

;; (define (position rect)
;;   (car rect))

;; (define (width rect)
;;   (car (dimensions rect)))

;; (define (height rect)
;;   (cdr (dimensions rect)))

;; (define (make-rect position width height)
;;   (cons position (make-dimensions width height)))

(define (make-rect bottom-left top-left top-right bottom-right)
  (list bottom-left top-left top-right bottom-right))

(define (bottom-left rect)
  (list-ref rect 0))

(define (top-left rect)
  (list-ref rect 1))
  
(define (top-right rect)
  (list-ref rect 2))

(define (bottom-right rect)
  (list-ref rect 3))

(define (width rect)
  (- (x-point (top-right rect)) (x-point (top-left rect))))

(define (height rect)
  (- (y-point (top-right rect)) (y-point (bottom-right rect))))

(define (area-rect rect)
  (* (width rect) (height rect)))

(define (perim-rect rect)
  (+ (* 2 (width rect)) (* 2 (height rect))))

(define myrect (make-rect (make-point 0 0) (make-point 0 2) (make-point 5 2) (make-point 5 0))) 



   
