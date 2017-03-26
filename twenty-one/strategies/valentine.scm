(load "./best-total")
(load "./game-core")
(load "./strategies/suit-strategy")
(load "./strategies/stop-at-17")

(define (valentine player-hand dealer-up-card)
    
  (let ((total (best-total player-hand)))
	(cond
	 ((<= total 17) #t)
	 ((and (<= total 19) (contains-heart? player-hand)) #t) 
	 (else #f))))

(define (valentine player-hand dealer-up-card)
  ((suit-strategy 'H (stop-at 19) (stop-at 17)) player-hand dealer-up-card))
