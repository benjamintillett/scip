(load "./test-helpers.scm")
(load "./twenty-one.scm")
(load "./strategies/stop-at-17.scm")

; dummy strategy used for test that always "sticks" on there first hand 
(define (always-stick-strategy player-hand dealer-up-card)
  #f)

(define (always-hit-strategy player-hand dealer-up-card)
  #t)

(test "play-n: return alway loses when always hits"
      (assert-equals -10 (play-n always-hit-strategy 10)))
