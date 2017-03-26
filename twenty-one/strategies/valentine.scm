(load "./best-total")
(load "./game-core")


(define (valentine player-hand dealer-up-card)
    
  (let ((total (best-total player-hand)))
	(cond
	 ((<= total 17) #t)
	 ((and (<= total 19) (contains-heart? player-hand)) #t) 
	 (else #f))))
