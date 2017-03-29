(load "./test-helpers")
(load "./count-change")

(test "count-change: returns 1 for for 1 cent"
      (assert-equals 1 (count-change 1)))

(test "count-change: returns 2 for 5 cents"
      (assert-equals 2 (count-change 5)))

(test "count-change: returns 292 for 100"
      (assert-equals 292 (count-change 100)))

(test "count-change-sent: returns 292 for 100"
      (assert-equals 292 (count-change-sent 100)))
