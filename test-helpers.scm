(define (assert-true a) a)

(define (test text assertion)
  (newline) (display (word "TEST: " text)) (newline)
  (if assertion
      (display "  PASS")
      (display "  FAIL"))
  (newline))


(test "one is is equal to one"
      (assert-true (= 1 1)))

(test "one is equal to two"
      (assert-true (= 1 2)))
