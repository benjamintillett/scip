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

(test "squares: returns a list with all the passed numbers sqaured"
      (assert-equals '(1 4 9) (squares '(1 2 3))))

(test "switch: replaces first You for i and all others i or me for you"
      (assert-equals '(i told you that you should wake me up) (switch '(You told me that i should wake you up)))) 
