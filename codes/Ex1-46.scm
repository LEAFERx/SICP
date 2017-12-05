(define (iterative-improve good-enough? improve)
  (define (iter x)
    (if (good-enough? x)
        x
        (iter (improve x))))
  iter)

(define (sqrt y)
  ((iterative-improve (lambda (x) (< (abs (- (* x x) y)) 0.001))
                     (lambda (x) (/ (+ x (/ y x)) 2)))
   y))
