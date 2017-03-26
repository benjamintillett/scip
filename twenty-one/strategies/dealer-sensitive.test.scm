(load "./test-helpers")
(load "./strategies/dealer-sensitive")
(load "./core")

(test "dealer-sensitive: returns false if player total >= 17"
      (assert-false (dealer-sensitive '(8D 10S) '3S)))

(test "dealer-sensitive: returns true when dealer card >= 7 , player total < 17"
      (assert-true (dealer-sensitive '(10D 6S) '7S)))

(test "dealer-sensitive: returns true when dealer card <= 6 , player total < 12"
      (assert-true (dealer-sensitive '(2D 6S) '3S)))



