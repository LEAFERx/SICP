; (define (odd? n) (= (remainder n 2) 1))

(define (sqaure x) (* x x))

(define (fast-expt-iter base index result)
    (cond ((= index 0) result)
          ((odd? index) (fast-expt-iter base (- index 1) (* result base)))
          (else (fast-expt-iter (sqaure base) (/ index 2) result))))

(define (fast-expt base index)
    (fast-expt-iter base index 1))