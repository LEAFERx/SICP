(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next x)
  (if (= x 2)
      3
      (+ x 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (begin (report-prime (- (runtime) start-time)) #t)
      #f))
      
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (next-odd x)
  (if (odd? x)
      (+ x 2)
      (+ x 1)))

(define (search-for-prime n)
  (define (iter n count)
    (cond ((= count 3) (newline) (display "DONE!"))
          ((timed-prime-test n) (iter (next-odd n) (+ count 1)))
          (else (iter (next-odd n) count))))
  (iter (+ 1 n) 0))