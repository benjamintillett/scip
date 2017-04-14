(load "./test-helpers")
(load "./picture.scm")

(test "add-vect: returns the sum of two vectors"
      (assert-equals
       (make-vect 10 16)
       (add-vect (make-vect 5 5) (make-vect 5 11))))

(test "sub-vect: returns the second vect subtracted from the first"
      (assert-equals
       (make-vect 1 2)
       (sub-vect (make-vect 5 6) (make-vect 4 4))))

(test "scale-vect: multiplys each coordinate by the scalar"
      (assert-equals
       (make-vect 2 4)
       (scale-vect 2 (make-vect 1 2))))
