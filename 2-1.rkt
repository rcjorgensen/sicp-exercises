#lang sicp

(define (sign x)
  (if (< x 0)
      -1
      1))

(define (make-rat n d)
  (let ((g (gcd n d))
        (s (sign d)))
    (cons (* s (/ n g)) (* s (/ d g)))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat -1 -2))
(print-rat (make-rat 1 -2))
(print-rat (make-rat -1 2))
(print-rat (make-rat 1 2))

(newline)
