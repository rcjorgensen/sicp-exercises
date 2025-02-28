#lang sicp

(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5)
; 21

(((double double) ((double double) inc)) 5)
; 21

(((double double) (double (double inc))) 5)
; 21

((double (double (double (double inc)))) 5)
; 21

