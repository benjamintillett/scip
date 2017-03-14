(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

(define (fib n)
  (cond
   ((= n 0) 0)
   ((= n 1) 1)
   (else (+ (fib (- n 1))
	    (fib (- n 2))))))
 

(define (pigl wd)
  (if (pl-done? wd)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))

(define (pl-done? wd)
  (vowel? (first wd)))

(define (vowel? letter)
  (member? letter '(a e i o u)))

(define (sum-sent sent)
  (if (empty? sent)
      0
      (+ (first sent) (sum-sent (bf sent)))))

(define (score-first-word sent)
  (if (equal? 'um (first sent))
      1
      0)  


(define (count-ums sent)
  (if (empty? sent)
      0
      (+
       (score-first-word sent)
       (count-ums (bf sent)))))



      
      
