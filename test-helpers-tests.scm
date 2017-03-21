(load "./test-helpers")

(test "assert-equals PASS for two matching numbers"
      (assert-equals 12 12))

(test "assert-equals FAIL for two non matching numbers"
      (assert-equals 12 13))

(test "assert-equals PASS for two matching words"
      (assert-equals 'sheep 'sheep))
      
(test "assert-equals FAIL for two non matching words"
      (assert-equals 'sheep 'dog))

(test "assert-equals PASS for two matching lists"
      (assert-equals '(sheep dog) '(sheep dog)))

(test "assert-equals FAIL for two non matching lists"
      (assert-equals '(sheep dog) '(sheep cat)))

(test "assert-equals FAIL for different types"
      (assert-equals 5 'cake))
