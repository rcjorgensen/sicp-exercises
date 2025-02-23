#lang sicp

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b) (accumulate + 0 term a next b))
(define (product term a next b) (accumulate * 1 term a next b))

(sum identity 1 inc 100)
; 5050
(product identity 1 inc 5)
; 120

(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-rec combiner null-value term (next a) next b))))

(define (sum-rec term a next b) (accumulate-rec + 0 term a next b))
(define (product-rec term a next b) (accumulate-rec * 1 term a next b))

(sum-rec identity 1 inc 100)
; 5050
(product-rec identity 1 inc 5)
; 120
