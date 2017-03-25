(load "./test-helpers.scm")

(test "best-total: returns correct answer with only number card"
      (assert-equals 14 (best-total '(3H 4S 7D))))

(test "best-total: returns the correct answer with only one ace"
      (assert-equals 15 (best-total '(AH 4S))))

(test "best-total: returns the correct answer 2 aces used as 1 and 11"
      (assert-equals 19 (best-total '(AH AD 7S))))

(test "best-total: returns the correct value when over 21"
     (assert-equals 23 (best-total '(AH AD 4S JH 7D))))

