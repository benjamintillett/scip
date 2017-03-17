(load "~/dev/sicp/test-helpers.scm")

(test "largest-square returns 3 for 13"
      (assert-equals 3 (largest-square 13 2)))

(test "largest-square returns 4 for 17"
      (assert-equals 4 (largest-square 17 2)))

(define (largest-square total guess)
 
  (define (good-enough?)
    (< total (* (next-guess) (next-guess))))

  (define (next-guess)
    (+ guess 1))

  (if (good-enough?)
      guess
      (largest-square total (next-guess))))

