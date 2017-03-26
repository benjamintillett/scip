(define (get-suit card)
  (last card))

(define (heart? card)
  (equal? (suit card) 'H))

(define (contains-heart? hand)
  (>= (count (keep heart? hand)) 1))

(define (contains-suit? suit hand)

  (define (matches-suit? card)
    (equal? (get-suit card) suit))

  (>= (count (keep matches-suit? hand)) 1))
