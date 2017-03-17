(load "./test-helpers")

(test "assert-equals returns true for two matching numbers"
      (assert-true (assert-equals 12 12)))

(test "assert-equals returns false for two non matching numbers"
      (assert-false (assert-equals 12 13)))

