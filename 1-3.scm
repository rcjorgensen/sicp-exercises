; returns the sum of the squares of the two larger numbers by testing which of the three numbers is smallest and summing the squares of the other two.
(define (sum-of-squares-of-two-largest a b c)
  (cond ((and (<= a b) 
              (<= a c) 
              (+ (square b) (square c))))
        ((and (<= b a) 
              (<= b c) 
              (+ (square a) (square c))))
        (else (+ (square a) (square b)))))
