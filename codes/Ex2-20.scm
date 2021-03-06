(define (same-party x . y)
  (define (same? x y)
    (or (and (even? x) (even? y)) (and (odd? x) (odd? y))))
  (define (iter l)
    (cond ((null? l) nil)
          ((same? (car l)) (cons (car l) (iter (cdr l))))
          (else (iter (cdr l))))
  (cons x (iter y)))