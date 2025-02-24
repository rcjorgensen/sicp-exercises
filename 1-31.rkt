#lang sicp

(#%require "basics.rkt")

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (product identity 1 inc n))

(factorial 0)
; 1
(factorial 1)
; 1
(factorial 2)
; 2
(factorial 3)
; 6
(factorial 4)
; 24
(factorial 5)
; 120

(define (pi-product a b)
  (define (pi-term x)
    (/ (* 4 x (+ x 1)) (square (+ (* 2 x) 1))))
  (product pi-term a inc b))

(* 4.0 (pi-product 1 100))

(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-rec term (next a) next b))))


(define (factorial-rec n)
  (product-rec identity 1 inc n))

(factorial-rec 0)
; 1
(factorial-rec 1)
; 1
(factorial-rec 2)
; 2
(factorial-rec 3)
; 6
(factorial-rec 4)
; 24
(factorial-rec 5)
; 120
