#lang sicp

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (let ((a (f (- x dx)))
          (b (f x))
          (c (f (+ x dx))))
      (/ (+ a b c) 3))))

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter n result)
    (if (= n 0)
        result
        (iter (- n 1) (compose f result))))
  (iter n identity))

(define (smooth-n n) (repeated smooth n))

((smooth abs) 0)
(((smooth-n 10) abs) 0)

