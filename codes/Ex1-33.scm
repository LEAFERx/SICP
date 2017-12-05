(define (filtered-accumulate combine null-value condition term a next b)
  (define (filter value)
    (if (condition value)
        value
        null-value))
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combine (filter (term a))
                       result))))
  (iter a null-value))

(define (sum-of-primes a b)
  (filtered-accumulate + 0 prime? (lambda (x) x) a (lambda (x) (+ x 1)) b))

