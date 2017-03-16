(define (print value)
  (display value) (newline))

(define (describe-time seconds)

  (define MINUTE 60)
  (define HOUR (* MINUTE 60))
  (define DAY (* HOUR 24))
   
  (define (contains-days)
    (>= seconds DAY))
  
  (define (get-days)
    (quotient seconds DAY))
  
  (define (contains-minutes)
    (>= seconds MINUTE))

  (define (get-minutes)
    (quotient seconds MINUTE))

  (define (get-hours)
    (quotient seconds HOUR))

  (define (contains-hours)
    (>= seconds HOUR))

  (cond
   ((contains-days)
    (se
     (get-days) 'DAYS
     (describe-time (remainder seconds DAY))))
   ((contains-hours)
    (se
     (get-hours) 'HOURS
     (describe-time (remainder seconds HOUR))))
   ((contains-minutes)
    (se
     (get-minutes) 'MINUTES
     (describe-time (remainder seconds MINUTE))))
   (else (se seconds 'SECONDS)))
  )


(print (describe-time 45))
(print (describe-time 61))
(print (describe-time (* 60 60 24)))
(print (describe-time (+ 6242 (* 60 60 24))))


(define (remove-once word sent)
  (cond
   ((empty? sent) ())
   ((equal? word (first sent)) (bf sent))
   (else (se (first sent) (remove-once word (bf sent))))))


(define (differences sent)
  (if (<= (length sent) 1)
      ()
      (se (- (item 1 sent) (item 2 sent)) (differences (bf sent)))))

(define (copies number word)
  (if (= number 1)
      word
      (se word (copies (- number 1) word))))

(define (base-grade grade)
  (cond
   ((equal? (first grade) 'A) 4)
   ((equal? (first grade) 'B) 3)
   ((equal? (first grade) 'C) 2)
   ((equal? (first grade) 'D) 1)
   (else 0)))

(define (grade-modifier grade)
  (cond
   ((equal? (last grade) '+) 0.33)
   ((equal? (last grade) '-) -0.33)
   (else 0)))

(define (map sent function)
  (if (empty? sent)
      ()
      (se (function (first sent)) (map (bf sent) function))))

(define (get-score grade)
  (+ (base-grade grade) (grade-modifier grade)))

(define (get-scores grades)
  (map grades get-score))

(define (sum sent)
  (if (empty? sent)
      0
      (+ (first sent) (sum (bf sent)))))

(define (gpa grades)
  (/ (sum (get-scores grades)) (length grades))) 


 (define (expand sent)
  (cond
   ((empty? sent) ())
   ((number? (first sent)) (se (n-words (first sent) (item 2 sent)) (expand (bf (bf sent))))) 
   (else (se (first sent) (expand (bf sent))))))
   
(define (n-words n word)
  (if (= n 0)
      '()
      (se word (n-words (- n 1) word))))

(define (count word)
  (if (empty? word)
      0
      (+ 1 (count (bf word)))))

(define (same-shape sent1 sent2)

  (define (both-empty?)
    (and (empty? sent1) (empty? sent2)))

  (define (one-empty?)
    (or (empty? sent1) (empty? sent2)))

  (define (first-word-same-length?)
    (= (count (first sent1)) (count (first sent2))))
    
  (cond
   ((both-empty?) #t)
   ((one-empty?) #f)
   ((first-word-same-length?) (same-shape (bf sent1) (bf sent2)))
   (else #f)))



(define (every sent predicate)
  (if (empty? sent)
      #t
      (and (predicate (first sent)) (every (bf sent) predicate))))

