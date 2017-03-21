(load "./test-helpers")
(load "./homework-2")

(test "substitue: correctly replaces 'yeah with 'maybe"
      (assert-equals
       '(she loves you maybe maybe maybe)  
       (substitute '(she loves you yeah yeah yeah) 'yeah 'maybe)))
