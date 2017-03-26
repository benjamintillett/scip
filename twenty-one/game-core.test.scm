(load "./test-helpers")
(load "./game-core")

(test "is-heart?: returns true for a heart"
      (assert-true (heart? 'AH)))

(test "is-heart?: returns false for non heart"
      (assert-false (heart? 'AD)))

(test "contains-heart?: returns true for a hand that contains a heart"
      (assert-true (contains-heart? '(3D JH))))

(test "contains-heart?: returns false for a hand that contains no hearts"
      (assert-false (contains-heart? '(3D JC))))
