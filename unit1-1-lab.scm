(define (sum fn a b)
  (if (> a b)
      0
      (+ (fn a) (sum fn (+ a 1) b))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough?  v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (y) (* 0.5 (+ y (f y)))))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
  1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ (/ x y) y)))
	       1.0))

(define (iterate start improve good-enough?)
  (if (good-enough? start)
      start
      (iterate (improve start) improve good-enough?)))

(define (fixed-point2 f first-guess)
  (iterate first-guess
	   (lambda (x) (f x))
	   (lambda (x) (< (abs (- x (f x))) tolerance))))

(define (sqrt2 x)
  (fixed-point2 (average-damp (lambda (y) (/ x y)))
  1.0))

(define (square x)
  (* x x))

(define (largest-square total guess)
  (iterate guess
	   (lambda (x) (+ x 1))
	   (lambda (x) (< total (square (+ x 1))))))
