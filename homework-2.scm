; Exercise 1 - Define substitute

(define (substitute sent old-word new-word)

  (define (first-word)
    (first sent))
  
  (define (first-word-matches)
    (equal? (first-word) old-word))

  (define (substitute-remaining)
    (substitute (bf sent) old-word new-word))

  (cond
   ((empty? sent) ())
   ((first-word-matches) (se new-word (substitute-remaining)))
   (else (se (first-word) (substitute-remaining)))))


; Exercise 7 - Define make-tester
(define (make-tester wd)
  (lambda (x) (equal? x wd))
)

; Exercise 8 - SICP exercises

; SICP 1.31a

(define (identity x) x)
(define (double-it x) (* 2 x))
(define (increment x) (+ 1 x))
(define (increment-two x) (+ 2 x))
(define (decrement x) (- x 1))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))) 
  )

(define (factorial x)
  (product identity 1 increment x))


(define (pi-term n)
  (if (even? n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))))

(define (estimate-pi)
  (* 4 (product pi-term 1 increment 10000))
)

; SICP 1.32a

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b)))
)


#|

Write sum in terms of accumulate:


Write product in terms of accumulate:

|#

(define (square x)
  (* x x))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

; SICP 1.33

(define (filtered-accumulate combiner null-value term a next b pred)
  (define (accumulate-rest)
    (filtered-accumulate combiner null-value term (next a) next b pred))
  (cond
   ((> a b) null-value)
   ((pred a) (combiner (term a) (accumulate-rest)))
   (else (accumulate-rest))))

(define (return-true x) #t)

(define (sum term a next b)
  (filtered-accumulate + 0 term a next b return-true))


(define (prime? x)

  (define (is-factor? y)
    (= 0 (remainder x y)))
  
  (define (prime-iter y)
    (cond
     ((<= y 1) #t)
     ((is-factor? y) #f)
     (else (prime-iter (- y 1)))))

  (if (<= x 1)
      #f
      (prime-iter (- x 1))))

(define (sum-of-primes-squared a b)
  (filtered-accumulate + 0 square a increment b prime?))

(define (every proc list)
  (if (empty? list)
      ()
      (se (proc (first list)) (every proc (bf list)))))

; SICP 1.40 - Define cubic

(define (cubic a b c)
  ; Your code here
  (error "Not yet implemented")
)

; SICP 1.41 - Define double

(define (double proc)
  ; Your code here
  (error "Not yet implemented")
)

; SICP 1.43 - Define repeated

(define (repeated proc n)
  ; Your code here
  (error "Not yet implemented")
)

; Exercise 9 - Define every


; Exercise 10 - Try out the expressions

#|

(every (lambda (letter) (word letter letter)) 'purple)
-> returns:

(every (lambda (number) (if (even? number) (word number number) number))
       '(781 5 76 909 24))
-> returns:

(keep even? '(781 5 76 909 24))
-> returns:

(keep (lambda (letter) (member? letter 'aeiou)) 'bookkeeper)
-> returns:

(keep (lambda (letter) (member? letter 'aeiou)) 'syzygy)
-> returns:

(keep (lambda (letter) (member? letter 'aeiou)) '(purple syzygy))
-> returns:

(keep (lambda (wd) (member? 'e wd)) '(purple syzygy))
-> returns:
|#

