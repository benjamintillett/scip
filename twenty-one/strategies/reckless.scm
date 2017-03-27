(define (reckless strategy)
  (lambda (player-hand dealer-up-card)
    (strategy (butlast player-hand) dealer-up-card)))
  
