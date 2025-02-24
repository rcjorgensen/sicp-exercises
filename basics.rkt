#lang sicp

(#%provide square)
(define (square x) (* x x))

(#%provide cube)
(define (cube x) (* x x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(#%provide prime?)
(define (prime? n)
  (if (<= n 1 )
      #f
      (= n (smallest-divisor n))))

(#%provide relative-prime?)
(define (relative-prime? a b)
  (= (gcd a b) 1))
