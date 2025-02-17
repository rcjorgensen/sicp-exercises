#lang sicp

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(f 1)
; 1
(f 2)
; 2
(f 3)
; 4
(f 4)
; 11

(define (f-iter a b c count)
  (if (< count 3)
    c
    (f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))

(define (g n)
  (if (< n 3)
    n 
    (f-iter 0 1 2 n)))

(g 1)
; 1
(g 2)
; 2
(g 3)
; 4
(g 4)
; 11
