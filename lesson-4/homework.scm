; Exercise 1

; SICP 2.7 - Define upper-bound and lower-bound

(define upper-bound cdr)
(define lower-bound car)

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (make-interval a b) (cons a b))

; SICP 2.8 - Define sub-interval
(define (sub-interval a b)
  (make-interval (- (lower-bound a) (lower-bound b))
		 (- (upper-bound a) (upper-bound b)))) 

; SICP 2.10 - Modify div-interval

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1 (upper-bound y))
                               (/ 1 (lower-bound y)))))





; SICP 2.12 - Define make-center-percent and percent

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (percent interval)
  (* 100 (/ (width interval) (center interval))))

(define (make-center-percent center percent)
  (let ((width (* center (/ percent 100))))
	(make-interval
	 (- center width)
	 (+ center width))))

; SICP 2.17 - Define last-pair
(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))

; SICP 2.20 - Define same-parity

(define (even? number)
  (= 0 (remainder number 2)))

(define (odd? number)
  (not (even? number)))

(define (same-parity num . num-list)
  (cons num
	(if (even? num)
	    (keep even? num-list)
	    (keep odd? num-list))))


; SICP 2.22 - Write your explanation in the comment block:
#|
Your explanation here
|#


; SICP 2.23 - Define for-each
(define (for-each proc items)
  (proc (car items))
  (if (null? (cdr items))
      nil
      (for-each proc (cdr items))))
      


; Exercise 2 - Define substitute

(define (substitute list old-word new-word)
  (define (replace-if-old elt)    
    (cond
     ((list? elt) (substitute elt old-word new-word))
     ((equal? elt old-word) new-word)
     (else elt)))
  
  (map replace-if-old list))


; Exercise 3 - Define substitute2


(define (substitute2 list old-words new-words)

  (define (replace-if-old elt)
    
    (define (replace-if-old-rec elt old new)
      (cond
       ((null? old) elt)
       ((equal? elt (car old)) (car new))
       (else (replace-if-old-rec elt (cdr old) (cdr new)))))

    (if (list? elt)
	(substitute2 elt old-words new-words)
	(replace-if-old-rec elt old-words new-words)))
  
  (map replace-if-old list))

	
