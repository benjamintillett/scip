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


