(define (div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "divide-interval cross zero")
      (mul ...)))