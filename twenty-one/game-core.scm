(load "./core")

(define (get-suit card)
  (last card))

(define (heart? card)
  (equal? (get-suit card) 'H))

(define (contains-heart? hand)
  (>= (count (keep heart? hand)) 1))

(define (contains-suit? suit hand)

  (define (matching-suit? card)
    (equal? (get-suit card) suit))

  (contains? hand matching-suit?))
