#lang sicp

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter n result)
    (if (= n 0)
        result
        (iter (- n 1) (compose f result))))
  (iter n identity))

(define (square x) (* x x))

((repeated square 2) 5)
; 625
