(load "./test-helpers.scm")
(load "./strategies/reckless")
(load "./strategies/stop-at-17.scm")

(test "reckeless: returns a strategy that ignores the last card"
      (let ((reckless-strategy (reckless stop-at-17)))
	(assert-true (reckless-strategy '(4D 10S 5H) 'AD))))

