(define (make-rat n d)
  (define (make n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
  (if (< d 0)
      (make (- n) (- d))
      (make n d)))