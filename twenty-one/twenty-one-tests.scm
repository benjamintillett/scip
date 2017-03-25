(load "./test-helpers.scm")
(load "./twenty-one.scm")
(load "./stop-at-17.scm")

; dummy strategy used for test that always "sticks" on there first hand 
(define (bad-strategy player-hand dealer-up-card)
  #f)

(test "play-n: return a value less than zero for bad strategy"
      (assert-true (< (play-n stop-at-17 1000) 0)))

;(test "play-n: returns 0 for games that always win"
;      (assert-equals 10 (play-n stop-at-17 10)))
