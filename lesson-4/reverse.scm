(define (reverse the-list)
  (if(empty? the-list)
     ()
     (append (reverse (cdr the-list)) (list (car the-list)))))
