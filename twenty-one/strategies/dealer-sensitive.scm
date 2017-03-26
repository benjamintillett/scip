(load "./best-total")

(define (dealer-sensitive player-hand dealer-up-card)
  (let (
	(player-score (best-total player-hand))
	(up-card-score (score-card dealer-up-card)))
    (cond
     ((and (>= up-card-score 7) (< player-total 17)) #t)
     ((and (<= up-card-score 6) (< player-total 12)) #t)
     (else #f))
    ))
