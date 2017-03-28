(define NUMBERS '(2 3 4 5 6 7 8 9 10))
(define FACES '(J Q K))
(define ACE 'A)
(define JACK 'X)

(define (get-rank card)
    (bl card))

(define (score-card card)
  (let ((rank (get-rank card)))
    (cond
     ((member? rank NUMBERS) rank)
     ((member? rank FACES) 10)
     ((equal? rank ACE) 1)
     ((equal? rank JACK) 0))))


  
    
  
