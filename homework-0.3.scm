(define (print value)
  (display value) (newline))

(define (describe-time seconds)

  (define MINUTE 60)
  (define HOUR (* MINUTE 60))
  (define DAY (* HOUR 24))
   
  (define (contains-days)
    (>= seconds DAY))
  
  (define (get-days)
    (quotient seconds DAY))
  
  (define (contains-minutes)
    (>= seconds MINUTE))

  (define (get-minutes)
    (quotient seconds MINUTE))

  (define (get-hours)
    (quotient seconds HOUR))

  (define (contains-hours)
    (>= seconds HOUR))

  (cond
   ((contains-days)
    (se
     (get-days) 'DAYS
     (describe-time (remainder seconds DAY))))
   ((contains-hours)
    (se
     (get-hours) 'HOURS
     (describe-time (remainder seconds HOUR))))
   ((contains-minutes)
    (se
     (get-minutes) 'MINUTES
     (describe-time (remainder seconds MINUTE))))
   (else (se seconds 'SECONDS)))
  )


(print (describe-time 45))
(print (describe-time 61))
(print (describe-time (* 60 60 24)))
(print (describe-time (+ 6242 (* 60 60 24))))


