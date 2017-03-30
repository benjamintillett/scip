(load "./test-helpers")

(test "sum-list"
      (assert-equals 6 (sum-list '(1 2 3))))

(test "sum-list"
      (assert-equals 4 (sum-list '(0 -1 5))))

(define lst (list (list 'hi 'hello)
		  (list 'my 'cat) 
                  (list 'name 'tag)
                  (list 'is 'that) 
                  (list 'adam 'smith)))


(test "car-list: takes a list of lists and returns a list containing the first element of each"
      (assert-equals '(hi my name is adam) (car-list lst)))
