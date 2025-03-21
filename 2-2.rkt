#lang sicp

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment s e)
  (cons s e))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (let ((start (start-segment s))
        (end (end-segment s)))
    (make-point (/ (+ (x-point start) (x-point end)) 2)
                (/ (+ (y-point start) (y-point end)) 2))))

(print-point (midpoint-segment (make-segment (make-point 1 1)
                                             (make-point 3 3))))
; (2,2)


(print-point (midpoint-segment (make-segment (make-point 1.0 1.0)
                                             (make-point 3.0 2.0))))
; (2.0,1.5)
