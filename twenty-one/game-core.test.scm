(load "./test-helpers")
(load "./game-core")

(test "heart?: returns true for a heart"
      (assert-true (heart? 'AH)))

(test "heart?: returns false for non heart"
      (assert-false (heart? 'AD)))

(test "contains-heart?: returns true for a hand that contains a heart"
      (assert-true (contains-heart? '(3D JH))))

(test "contains-heart?: returns false for a hand that contains no hearts"
      (assert-false (contains-heart? '(3D JC))))

(test "contains-suit?: returns true for a hand that contains the given suit"
      (assert-true (contains-suit? 'H '(3D JH))))

(test "contains-suit?: returns false for a hand that doesn't contain the given suit"
      (assert-false (contains-suit? 'S '(3D JH))))
