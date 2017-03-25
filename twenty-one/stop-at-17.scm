(load "./best-total.scm")

(define (stop-at-17 player-hand dealer-up-card)
  (display (best-total (se player-hand dealer-up-card)))
  (< (best-total (se player-hand dealer-up-card)) 17))
      
