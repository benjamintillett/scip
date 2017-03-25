(define (filtered-accumulate combiner null-value term a next b pred)
  (define (accumulate-rest)
    (filtered-accumulate combiner null-value term (next a) next b pred))
  (cond
   ((> a b) null-value)
   ((pred a) (combiner (term a) (accumulate-rest)))
   (else (accumulate-rest))))

(define (reject predicate list)
 (keep (lambda (x) (not (predicate x))) list)) 

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b)))
)

(define (increment x)
  (+ 1 x))
