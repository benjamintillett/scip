(load "./helpers")

; an assertion in a lamda that returns a bool  

(define (assert-true assertion)
   assertion)

(define (assert-false assertion)
  (lambda ()
    (not (assertion))))

(define (assert-equals a b)
  (assert-equals-number a b))

(define (assert-equals a b)
  (define (assertion)
    (display (word "\n  EXPECTED: " a))
    (display (word "\n  ACTUAL: " b))
    (= a b))
  assertion)

  
(define (test text assertion)
  (display (word "\nTEST: " text))
  (if (assertion)
      (display "\n    PASS")
      (display "\n    FAIL"))
  (newline))

