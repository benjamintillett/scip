(load "./best-total")
(load "./game-core")


(define (valentine player-hand dealer-up-card)
  (define (contains-heart)
    
  (let ((total (best-total player-hand)))
	(cond
	 ((< total 17) #t)
	 (else #f))))
