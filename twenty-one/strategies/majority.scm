(define (majority strategy-a strategy-b strategy-c)
  (lambda (player-hand dealer-up-card)
    (let ((a-true (strategy-a player-hand dealer-up-card))
	  (b-true (strategy-b player-hand dealer-up-card))
	  (c-true (strategy-c player-hand dealer-up-card)))
      (or
       (and a-true b-true)
       (and b-true c-true)
       (and c-true a-true)))))
