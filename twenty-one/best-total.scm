(load "./core")
(load "./score-card")

; note: a promoted ace is an ace whose value has been raised to 11

(define (best-total hand)

  (define (ace? card)    
    if(number? (get-rank card))
     #f
     (equal? (first card) 'A))
  
  (define (num-aces)
    (count (keep ace? hand)))

  (define (total)
    (accumulate + (every score-card hand)))
    
  (define (total-with-n-promoted-aces n)
    (+ (total) (* 10 n)))
 
  (define (calculate-best-total num-promoted-aces)
    (let ((current-total (total-with-n-promoted-aces num-promoted-aces)))
    (cond
     ((= num-promoted-aces 0) current-total)
     ((< current-total 21) current-total)
     (else (calculate-best-total (- num-promoted-aces 1))))))

  (calculate-best-total (num-aces)))
