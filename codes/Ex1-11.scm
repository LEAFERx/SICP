(define (recur-f n)
    (if (< n 3) n
        (+ (recur-f (- n 1))
           (* 2 (recur-f (- n 2)))
           (* 3 (recur-f (- n 3))))))

(define (iter-f n)
    (define (iter x y z count)
        (if (= count 0)
            z
            (iter (+ x (* 2 y) (* 3 z))
                  x
                  y
                  (- count 1))))
    (iter 2 1 0 n))
