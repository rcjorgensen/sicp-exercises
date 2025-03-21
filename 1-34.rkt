#lang sicp

(define (square x) (* x x))

(define (f g) (g 2))

(f square)
; 4

(f (lambda (z) (* z (+ z 1))))
; 6

(f f)
; error
