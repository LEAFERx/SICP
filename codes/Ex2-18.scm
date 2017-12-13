(define (reverse items)
  (if (null? items)
      nil
      (cons (reverse (cdr items)) (car items)))