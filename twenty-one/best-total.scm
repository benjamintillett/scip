(load "./core")
(load "./score-card")

; note: a promoted ace is an ace whose value has been raised to 11

(define (best-total hand)  

  (define (num-aces)
    (count (keep ace? hand)))
  
  (define (num-jacks)
    (count (keep jack? hand)))
  
  (define (total)
    (accumulate + (every score-card hand)))
    
  (define (total-with-n-promoted-aces n)
    (+ (total) (* 10 n)))

  (define (target-without-jacks)
    (- 21 (num-jacks)))  

  (define (best-total-without-jacks num-promoted-aces)
    (let ((current-total (total-with-n-promoted-aces num-promoted-aces)))
    (cond
     ((= num-promoted-aces 0) current-total)
     ((< current-total (target-without-jacks)) current-total)
     (else (best-total-without-jacks (- num-promoted-aces 1))))))

  (define (best-total-less-than-target?)
    (<= (best-total-without-jacks (num-aces)) (target-without-jacks)))

  (define (best-total-within-jacks-of-21)
     (>= (best-total-without-jacks (num-aces)) (- 21 (* (num-jacks) 11))))

  (define (twenty-one?)
    (and (best-total-less-than-target?) (best-total-within-jacks-of-21)))

  (define (total-jacks-as-1)
    (+ (best-total-without-jacks (num-aces)) (num-jacks)))

  (define (total-jacks-as-11)
      (+ (best-total-without-jacks (num-aces))(* (num-jacks) 11)))

  (cond
   ((twenty-one?) 21)
   ((best-total-less-than-target?) (total-jacks-as-11))
   (else (total-jacks-as-1))))
