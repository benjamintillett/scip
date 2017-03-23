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

(define (square number)
  (* number number))

(define (squares list)
  (if (empty? list)
      ()
      (se (square (first list)) (squares (bf list)))))

(define (switch sent)
  (define (switch-words sent)

    (define (starts-with-me-or-i)
      (or (equal? 'i (first sent)) (equal? 'me (first sent))))

    (define (starts-with-you)
      (equal? 'you (first sent)))
    
    (cond
     ((empty? sent) ())
     ((starts-with-me-or-i) (se 'you (switch-words (bf sent))))
     ((starts-with-you) (se 'me (switch-words (bf sent)))) 
     (else (se (first sent) (switch-words (bf sent))))))

  (se 'i (switch-words (bf sent))))

(define (ordered? sent)
  (cond
   ((empty? sent) #t)
   ((= (length sent) 1) #t)
   ((< (item 1 sent) (item 2 sent)) (ordered? (bf sent)))
   (else #f)))

