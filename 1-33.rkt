#lang sicp

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

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (if (<= n 1 )
      #f
      (= n (smallest-divisor n))))

(prime? 1)
; #f

(define (sum-squares-of-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

(sum-squares-of-primes 1 10)
; 87

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)
; 2

(define (relative-prime? a b)
  (= (gcd a b) 1))

(relative-prime? 4 9)
; #t

(define (product-relative-prime n)
  (define (relative-prime-with-n? i)
    (relative-prime? i n))
  (filtered-accumulate * 1 identity 1 inc (- n 1) relative-prime-with-n?))

(product-relative-prime 10)
; 189
