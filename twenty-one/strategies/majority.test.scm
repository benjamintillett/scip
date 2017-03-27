(load "./test-helpers")
(load "./strategies/majority")

(define (strategy-true player-hand dealer-up-card)
  #t)

(define (strategy-false player-hand dealer-up-card)
  #f)

(test "majority: returns true when all strategies return true"
      (let ((majority-strategy (majority strategy-true strategy-true strategy-true)))
	(assert-true (majority-strategy '(AD 10J) '2S))))

(test "majority: returns true when 2 strategies return true"
      (let ((majority-strategy (majority strategy-false strategy-true strategy-true)))
	(assert-true (majority-strategy '(AD 10J) '2S))))

(test "majority: returns false when only 1 strategies return true"
      (let ((majority-strategy (majority strategy-false strategy-false strategy-true)))
	(assert-false (majority-strategy '(AD 10J) '2S))))

(test "majority: returns false when all false"
      (let ((majority-strategy (majority strategy-false strategy-false strategy-false)))
	(assert-false (majority-strategy '(AD 10J) '2S))))



