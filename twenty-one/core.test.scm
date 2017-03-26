(load "./test-helpers")
(load "./core")

(test "count-where: return the number of items that satisfy the predicate"
      (assert-equals 2 (count-where '(3 D SD #f 1) number?)))

(test "contains-where?: return true if 1 item satisfies the predicate "
      (assert-true (contains-where? '(D 4 1) number?)))

(test "contains-where?: return true if 1 item satisfies the predicate "
      (assert-false (contains-where? '(D #t B) number?)))
