(load "./segments-and-points")

(define make-dimensions cons)

(define (dimensions rect)
  (cdr rect))

(define (position rect)
  (car rect))

(define (width rect)
  (car (dimensions rect)))

(define (height rect)
  (cdr (dimensions rect)))

(define (make-rect position width height)
  (cons position (make-dimensions width height)))

(define (area-rect rect)
  (* (width rect) (height rect)))

(define (perim-rect rect)
  (+ (* 2 (width rect)) (* 2 (height rect))))





   
