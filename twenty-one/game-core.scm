(define (suit card)
  (last card))

(define (heart? card)
  (equal? (suit card) 'H))

(define (contains-heart? hand)
  (= 1 (count (keep heart? hand))))
