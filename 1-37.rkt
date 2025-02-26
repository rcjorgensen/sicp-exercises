#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-helper n d i k)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (cont-frac-helper n d (inc i) k)))))
  (cont-frac-helper n d 1 k))

(define (n _) 1.0)
(define (d _) 1.0)

(cont-frac n d 1)
; 1.0

(cont-frac n d 2)
; 0.5

(cont-frac n d 3)
; 0.666...

(define tolerance 0.00001)
(define phi 1.6180)

(define (close-enough? x y)
  (< (abs (- x y)) tolerance))

(define (try k)
  (if (close-enough? (cont-frac n d k) (/ 1 phi))
      k
      (try (inc k))))

(try 1)

(/ 1 phi)
(cont-frac n d (try 1))
