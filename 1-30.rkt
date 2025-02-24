#lang sicp

(#%require "basics.rkt")

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)
