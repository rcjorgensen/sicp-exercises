#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p _) p)))

(define (cdr z)
  (z (lambda (_ q) q)))

(car (cons 1 2))
(cdr (cons 1 2))
