(define (remove-once word sent)
  (cond
   ((empty? sent) ())
   ((equal? word (first sent)) (bf sent))
   (else (se (first sent) (remove-once word (bf sent))))))
