(define NUMBERS '(2 3 4 5 6 7 8 9 10))
(define FACES '(J Q K))
(define ACE 'A)

(define (score-card card)

  (define (rank)
    (bl card))
  
  (define (score-rank rank)
    (cond
     ((member? rank NUMBERS) rank)
     ((member? rank FACES) 10)
     ((equal? rank ACE) #f)))

  (score-rank (rank)))
    
  
