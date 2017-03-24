(load "./test-helpers")
(load "./score-card")

(test "score-card: returns one for one of spades"
      (assert-equals 1 (score-card '1S)))

(test "score-card: returns two for two of hearts"
      (assert-equals 2 (score-card '2S)))

(test "score-card: returns 10 for jack of spades"
      (assert-equals 10 (score-card 'JS)))

(test "score-card: returns false for ace of hearts"
      (assert-equals #f (score-card 'AH)))
