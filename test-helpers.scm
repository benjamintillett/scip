(define (assert-true a) a)
(define (assert-false a) (not a))
(define (assert-equals a b)
  (= a b))

(define (test text assertion)
  (newline) (display (word "TEST: " text)) (newline)
  (if assertion
      (display "  PASS")
      (display "  FAIL"))
  (newline))


