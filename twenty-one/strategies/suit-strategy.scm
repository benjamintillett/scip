(load "./game-core")


(define (suit-strategy suit with-suit-strategy without-suit-strategy)
  (lambda (player-hand dealer-up-card)
    (if (contains-suit? suit player-hand)
	(with-suit-strategy player-hand dealer-up-card)
	(without-suit-strategy player-hand dealer-up-card))))
  
