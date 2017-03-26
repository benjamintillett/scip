(load "./test-helpers")
(load "./strategies/stop-at-17")

(test "stop-at-17: returns true when value of hand less than 17"
      (assert-true (stop-at-17 '(5S 5A) '9D)))

(test "stop-at-17: returns false when value of hand is 17"
      (assert-false (stop-at-17 '(5S 5A 7A) '7D)))

(test "stop-at-17: returns false when the value is greater than 17"
      (assert-false (stop-at-17 '(10S JC) '2D)))

