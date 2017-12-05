(define (smooth f dx)
  (define (average a b c) (/ (+ a b c) 3))
  (lambda (x) (average (f (- x dx))
                       (f x)
                       (f (+ x dx)))))

