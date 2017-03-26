(load "./test-helpers")
(load "./strategies/valentine")

(test "valentine: returns true when hand is less than 17"
      (assert-true (valentine '(6D 9S) 'AS)))

(test "valentine: returns true when hand is 19 but contains Heart"
      (assert-true (valentine '(10D 9H) 'AS)))

(test "valentine: returns false hand is 19 but contains no Heart"
      (assert-false (valentine '(10D 9S) 'AS)))

(test "valentine: returns false if hand is over 19"
      (assert-false (valentine '(10S QH) 'AS)))
