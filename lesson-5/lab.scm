(define (count-leaves x)
  (cond
   ((null? x) 0)
   ((not (pair? x)) 1)
   (else (+ (count-leaves (car x))
	    (count-leaves (cdr x))))))
  

(define (scale-tree tree factor)
  (cond ((null? tree) ())
	((not (pair? tree)) (* tree factor))
	(else (cons (scale-tree (car tree) factor)
		    (scale-tree (cdr tree) factor)))))



(define (scale-tree tree factor)
  (map
   (lambda (sub-tree)
     (if (pair? sub-tree)
	 (scale-tree sub-tree factor)
	 (* factor sub-tree)))
   tree))



(define (reverse the-list)
  (if (empty? the-list)
      ()
      (append (reverse (cdr the-list)) (list (car the-list)))))

(define (deep-reverse tree)
  (reverse
   (map
    (lambda (sub-tree)
      (if (pair? sub-tree)
	  (deep-reverse sub-tree)
	   sub-tree))
    tree)))

(define make-tree cons)
(define datum car)
(define children cdr)

(define (leaf? node)
  (null? (children node)))

(define (treemap fn tree)
    (make-tree (fn (datum tree))
               (forest-map fn (children tree))))

(define (forest-map fn forest)
    (if (null? forest)
        '()
        (cons  (treemap fn (car forest))
               (forest-map fn (cdr forest)))))


(define (count-leaves tree)
  (if (leaf? tree)
      1
      (count-leaves-in-forest (children tree))))

(define (count-leaves-in-forest forest)
  (if (null? forest)
      0
      (+ (count-leaves (car forest))
	 (count-leaves-in-forest (cdr forest)))))
