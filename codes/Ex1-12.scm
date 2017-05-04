(define (pascal x y)
    (cond ((or (= y 0) (= y x)) 1)
          (else (+ (pascal (- x 1) (- y 1)) (pascal (- x 1) y)))))

(define (factorial n)
    (define (fact-iter product counter max-count)
        (if (> counter max-count)
            product
            (fact-iter (* counter product)
                    (+ counter 1)
                    max-count)))
    (fact-iter 1 1 n))

(define (iter-pascal x y)
    (/ (factorial x)
       (* (factorial y)
          (factorial (- x y)))))