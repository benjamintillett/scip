(load "./test-helpers")

(define point-a (make-point 2 6))
(define point-b (make-point 4 8))
(define segment (make-segment point-a point-b))
(define expected-midpoint (make-point 3 7))

(test "midpoint-segment: returns the correct segment"
      (assert-equals expected-midpoint (midpoint-segment segment)))
