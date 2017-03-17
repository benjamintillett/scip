(load "~/dev/sicp/test-helpers.scm")


(define (left-over total guess)
  (- total (* guess guess)))

(define (good-enough? total guess)
   (> 0 (left-over total (+ guess 1))))

(define (largest-square total guess)
  (if (good-enough? total guess)
      guess
      (largest-square total (+ guess 1))))
    

(test "good-enough? returns true for 13 and 3"
      (assert-true (good-enough? 13 3)))

(test "good-enough? returns false for 13 and 2"
      (assert-false (good-enough? 13 2)))

(test "largest-square returns 3 for 13"
      (assert-equals 3 (largest-square 13 2)))
