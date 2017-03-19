(define (dupls-removed sent)
  (cond
   ((empty? sent) ())
   ((member? (first sent) (bf sent)) (dupls-removed (bf sent)))
   (else (se (first sent) (dupls-removed (bf sent))))))
      

(define (count-word sent word)
  (cond
   ((empty? sent) 0)
   ((equal? word (first sent)) (+ 1 (count-word (bf sent) word)))
   (else (count-word (bf sent) word))))
