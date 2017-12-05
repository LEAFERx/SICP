(define (square x) (* x x))

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

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
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