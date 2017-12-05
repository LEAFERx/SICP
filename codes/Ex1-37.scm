(define (cout-frac n d k)
  (define (iter step result)
    (if (= step 0)
        result
        (iter (- step 1)
              (/ (n step)
                 (+ result (d step))))))
  (iter k 0))

(define (cout-frac-recursive n d k)
  (define (cf i)
    (if (= k i)
        (/ (n k) (d k))
        (/ (n i)
           (+ (d i) (cf (+ i 1))))))
  (cf 1))

