(load "./test-helpers")
(load "./score-card")

(test "score-card: returns one for one of spades"
      (assert-equals 1 (score-card '1S)))
