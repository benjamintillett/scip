(load "./test-helpers")
(load "./homework-2")

; Exercise 1
(test "substitue: correctly replaces 'yeah with 'maybe"
      (assert-equals
       '(she loves you maybe maybe maybe)  
       (substitute '(she loves you yeah yeah yeah) 'yeah 'maybe)))

;Exercise 7
(test "((make-tester 'hal) 'hal) returns true"
      (assert-true ((make-tester 'hal) 'hal)))

(test "((make-tester 'hal) 'small) returns false"
      (assert-false ((make-tester 'hal) 'small)))

;Exercise 8
(test "product returns the correct product with increment and identity "
      (assert-equals
       24
       (product identity 1 increment 4)))

(test "product returns the correct product with increment-two and double"
      (assert-equals
       12
       (product double-it 1 increment-two 4)))

(test "(factorial 5) returns 120"
      (assert-equals
       120
       (factorial 5)))

(define pi 3.14159265359)

(test "estimate pi returns a value within 0.0001 of pi"
      (assert-true
       (< (abs (- (estimate-pi) pi)) 0.001)))

(test "sum: return the corrent value with increment and identity"
      (assert-equals
       15
       (sum identity 1 increment 5)))

(test "(prime? 1) returns false"
      (assert-false (prime? 1)))

(test "(prime? 2) returns true"
      (assert-true (prime? 2)))

(test "(prime? 4) returns false"
      (assert-false (prime? 4)))

(test "(prime? 401) returns true"
      (assert-true (prime? 401)))

(test "(sum-of-primes-squared 1 5) returns 38"
      (assert-equals
       38
       (sum-of-primes-squared 1 5)))


; Exercise 9
(test "(every square '(1 2 3 4)) applies squre to each argument in the list"
      (assert-equals
       '(1 4 9 16)
       (every square '(1 2 3 4))))

(test "(every square word with a different procudure"
      (assert-equals
       '(n m)
       (every first '(nowhere man))))
