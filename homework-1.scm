(define (dupls-removed sent)
  (cond
   ((empty? sent) ())
   ((member? (first sent) (bf sent)) (dupls-removed (bf sent)))
   (else (se (first sent) (dupls-removed (bf sent))))))
      

(define (check-for-dups sent)
  (cond
   ((empty? sent) #f)
   ((member? (first sent) (bf sent)) #t)
   (check-for-dups (bf sent))))
   
