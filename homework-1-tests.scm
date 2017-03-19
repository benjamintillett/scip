(load "./test-helpers.scm")
(load "./homework-1.scm")

(test "dups-removed removes those dups"
      (assert-equals '(c a d e b) (dupls-removed '(a b c a e d e b))))

(test "dups-removed return original sentence if no dupes"
      (assert-equals '(a b c) (dupls-removed '(a b c))))
