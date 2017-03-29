(define make-segment cons)

(define start-segment car)

(define end-segment cdr)

(define make-point cons)

(define x-point car)

(define y-point cdr)

(define (midpoint-segment segment)
  (make-segment
   (/ (+ (x-point (start-segment segment)) (x-point (end-segment segment))) 2)
   (/ (+ (y-point (start-segment segment)) (y-point (end-segment segment))) 2)
   ))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define point-a (make-point 1 3))
(define point-b (make-point 2 4))
(define segment (make-segment point-a point-b))

(print-point (midpoint-segment segment))
