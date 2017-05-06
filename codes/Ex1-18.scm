(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (mul-iter a b result)
    (cond ((= a 0) result)
          ((even? a) (mul-iter (halve a) (double b) result))
          (else (mul-iter (- a 1) b (+ result b)))))

(define (mul a b)
    (mul-iter a b 0))