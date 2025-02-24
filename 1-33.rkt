#lang sicp

(#%require "basics.rkt")

(define (filtered-accumulate combiner null-value term a next b keep?)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (if (keep? a) (combiner result (term a)) result))))
  (iter a null-value))

(define (sum-even a b)
  (filtered-accumulate + 0 identity a inc b even?))

(sum-even 1 10)
; 30

(prime? 1)
; #f

(define (sum-squares-of-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

(sum-squares-of-primes 1 10)
; 87

(relative-prime? 4 9)
; #t

(define (product-relative-prime n)
  (define (relative-prime-with-n? i)
    (relative-prime? i n))
  (filtered-accumulate * 1 identity 1 inc (- n 1) relative-prime-with-n?))

(product-relative-prime 10)
; 189
