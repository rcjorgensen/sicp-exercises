#lang sicp

(define (cont-frac n d k)
  (define (recurse i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (recurse (inc i))))))
  (recurse 1))

(define (cont-frac-iter n d k)
  (define (iter k result)
    (if (< k 1)
        result
        (iter (dec k) (/ (n k) (+ (d k) result)))))
  (iter k 0))

(define (n _) 1.0)
(define (d _) 1.0)

(cont-frac n d 1)
(cont-frac-iter n d 1)
; 1.0

(cont-frac n d 2)
(cont-frac-iter n d 2)
; 0.5

(cont-frac n d 3)
(cont-frac-iter n d 3)
; 0.666...

(define tolerance 0.00001)
(define phi 1.6180)

(define (close-enough? x y)
  (< (abs (- x y)) tolerance))

(define (try k)
  (if (close-enough? (cont-frac n d k) (/ 1 phi))
      k
      (try (inc k))))

(define (try-iter k)
  (if (close-enough? (cont-frac-iter n d k) (/ 1 phi))
      k
      (try-iter (inc k))))

(try 1)
(try-iter 1)

(/ 1 phi)
(cont-frac n d (try 1))

(newline)

(/ 1 phi)
(cont-frac-iter n d (try 1))
