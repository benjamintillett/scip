(load "./helpers")

; an assertion in a lamda that returns a bool  

(define (assert-true assertion)
   assertion)

(define (assert-false assertion)
  (lambda ()
    (not (assertion))))

(define (assert-equals a b)

  (define (both-numbers?)
    (and (number? a) (number? b)))

  (define (both-words?)
    (and (word? a) (word? b)))

  (define (both-strings?)
    (and (string? a) (string? b))) 

  (define (both-lists?)
    (and (list? a) (list? b)))
  
  (lambda ()
    (display "\n  EXPECTED: ")
    (display a)
    (display "\n  ACTUAL: ")
    (display b)
    (cond
     ((both-numbers?)
      (= a b))
     ((or both-words? both-lists? both-strings?)
      (equal? a b))
     (else #f))))

(define (assert-equals-number a b)
  (= a b))

(define (test text assertion)
  (display (word "\nTEST: " text))
  (if (assertion)
      (display "\n    PASS")
      (display "\n    FAIL"))
  (newline))

