(load "./test-helpers.scm")
(load "./homework-1.scm")

(test "dups-removed: removes those dups"
      (assert-equals '(c a d e b) (dupls-removed '(a b c a e d e b))))

(test "dups-removed: return original sentence if no dupes"
      (assert-equals '(a b c) (dupls-removed '(a b c))))

(test "count-word: returns 0 if no matching words"
      (assert-equals 0 (count-word '(i really like) 'not)))

(test "count-word: returns the correct number of matching words"
      (assert-equals 2 (count-word '(i not really like not) 'not)))
