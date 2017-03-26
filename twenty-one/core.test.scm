(load "./test-helpers")
(load "./core")

(test "count-where: return the number of items that satisfy the predicate"
      (assert-equals 2 (count-where '(3 D SD #f 1) number?)))

(test "contains?: return true if 1 item satisfies the predicate "
      (assert-true (contains? '(D 4 1) number?)))

(test "contains?: return true if 1 item satisfies the predicate "
      (assert-false (contains? '(D #t B) number?)))
