(define (filtered-accumulate combiner null-value term a next b pred)
  (define (accumulate-rest)
    (filtered-accumulate combiner null-value term (next a) next b pred))
  (cond
   ((> a b) null-value)
   ((pred a) (combiner (term a) (accumulate-rest)))
   (else (accumulate-rest))))
