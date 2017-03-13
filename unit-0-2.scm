(define (first-two a-word)
  (word
   (item 1 a-word)
   (item 2 a-word))) 

(define (two-first word-1 word-2)
  (word
   (first word-1)
   (first word-2)))

(define (two-first-sent sentence)
  (word
   (item 1 (item 1 sentence))
   (item 1 (item 2 sentence))))

(define (indef-article word)
  (se
   (cond
    ((equal? (first word) 'a) 'an)
    ((equal? (first word) 'e) 'an)
    ((equal? (first word) 'i) 'an)
    ((equal? (first word) 'o) 'an)
    ((equal? (first word) 'u) 'an)
    (else 'a)
    )
   word
 ))
