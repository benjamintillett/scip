(load "./test-helpers.scm")
(load "./rectangle.scm")

(define my-rect (make-rect (make-point 0 0) 2 5))

(test "area-rect: returns the area of the rectangle"
      (assert-equals
       10
       (area-rect my-rect)))

(test "perim-rect: returns the perimeter of the rectangle"
      (assert-equals
       14
       (perim-rect my-rect)))
