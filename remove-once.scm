(define (remove-once word sent)
  (cond
   ((empty? sent) ())
   ((equal? word (first sent)) (bf sent))
   (else (se (first sent) (remove-once word (bf sent))))))


(define (differences sent)
  (if (<= (length sent) 1)
      ()
      (se (- (item 1 sent) (item 2 sent)) (differences (bf sent)))))
