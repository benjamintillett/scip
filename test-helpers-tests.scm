(load "./test-helpers")

(test "assert-equals returns true for two matching numbers"
      (assert-true (assert-equals 12 12)))

(test "assert-equals returns false for two non matching numbers"
      (assert-false (assert-equals 12 13)))

(test "assert-equals returns true for two matching words"
      (assert-true (assert-equals 'sheep 'sheep)))
      
(test "assert-equals returns false for two non matching words"
      (assert-false (assert-equals 'sheep 'dog)))

(test "assert-equals returns true for two matching lists"
      (assert-true (assert-equals '(sheep dog) '(sheep dog))))

(test "assert-equals returns false for two non matching lists"
      (assert-true (assert-equals '(sheep dog) '(sheep cat))))

(test "assert-equals returns equal for different types"
      (assert-false (assert-equals 5 'cake)))
