(define (sum-list list)
  (if(empty? list)
     0
     (+ (car list) (sum-list (cdr list)))))

(define (car-list list)
  (map car list))
