(define (repeated f times)
  (if (= times 1)
      f
      (compose f (repeated f (- times 1)))))

