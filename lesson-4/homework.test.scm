(load "./test-helpers")

(test "sub-interval: return new interval that is the 1st interval subtracted from the second"
      (assert-equals
       (make-interval 2 1)
       (sub-interval (make-interval 3 9) (make-interval 1 8))))

(test "percent: returns the difference between the midpoint and the bounds as percentage of the midpoint"
      (assert-equals
       10
       (percent (make-interval 9 11))))

(test "make-center-percent: returns the interval 9-11 when passed 10 10"
      (assert-equals
       (make-interval 9 11)
       (make-center-percent 10 10)))

(test "same-parity: returns a list of all the even numbers if the 1st number is even"
      (assert-equals
       '(1 3 5 7)
       (same-parity 1 2 3 4 5 6 7)))

(test "substitue: return a new list with all occorances of second param replaced with third para"
      (assert-equals
       '(guitar viola piano viola)
       (substitute '(guitar bass piano bass) 'bass 'viola)))

(test "subsitute: works for nested lists"
      (assert-equals
       '((lead axe) (bass axe) (rhythm axe) drums)
       (substitute '((lead guitar) (bass guitar) (rhythm guitar) drums)
                     'guitar
                     'axe)))

(test "substitute2: replaces a list of old words with a list of new"
      (assert-equals
       '((four calling birds) (three french hens) (two turtle doves))       
       (substitute2 '((4 calling birds) (3 french hens) (2 turtle doves))
		    '(1 2 3 4)
		    '(one two three four))))
