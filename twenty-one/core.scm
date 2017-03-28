(define (filtered-accumulate combiner null-value term a next b pred)
  (define (accumulate-rest)
    (filtered-accumulate combiner null-value term (next a) next b pred))
  (cond
   ((> a b) null-value)
   ((pred a) (combiner (term a) (accumulate-rest)))
   (else (accumulate-rest))))

(define (reject predicate list)
 (keep (lambda (x) (not (predicate x))) list)) 

(define (accumulate-series combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-series combiner null-value term (next a) next b)))
)

(define (increment x)
  (+ 1 x))

(define (count-where list predicate)
  (count (keep predicate list)))

(define (contains? list predicate)
  (>= (count-where list predicate) 1))

(define (ace? card)
  if(number? (get-rank card))
  #f
  (equal? (get-rank card) 'A))

(define (jack? card)
  if(number? (get-rank card))
  #f
  (equal? (get-rank card) 'X))
