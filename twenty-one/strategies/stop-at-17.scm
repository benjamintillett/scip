(load "./best-total.scm")

(define (stop-at n)
  (lambda (player-hand dealer-up-card)
    (< (best-total player-hand) n)))

(define (stop-at-17 player-hand dealer-up-card)
  ((stop-at 17) player-hand dealer-up-card))
