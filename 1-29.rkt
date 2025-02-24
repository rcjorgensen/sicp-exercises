#lang sicp

(#%require "basics.rkt")

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; assumes n is even
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (term k)
    (* (cond
         ((or (= k 0) (= k n)) 1)
         ((odd? k) 4)
         (else 2)) (f (+ a (* k h)))))
  (* (/ h 3)
     (sum term 0 inc n)))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)
