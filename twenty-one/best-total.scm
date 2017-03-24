(load "./core")
(load "./score-card")



(define (best-total hand)

  (define (ace? card)    
    if(number? (get-rank card))
     #f
     (equal? (first card) 'A))
  
  (define (not-ace? card)
    (not (ace? card)))

  (define (count-aces)
    (count (keep ace? hand)))
  
  (define (total-without-aces)
    (accumulate + (every score-card (keep not-ace? hand))))

  (define (best-total-with-aces total-without-aces num-aces)
    (let ((total (+ total-without-aces (* 11 num-aces))))
      (cond
       ((= num-aces 0) total) 
       ((< total 21) total)
       (else (+ 1 (best-total-with-aces total-without-aces (- num-aces 1)))))))
  
  (best-total-with-aces (total-without-aces) (count-aces)))
