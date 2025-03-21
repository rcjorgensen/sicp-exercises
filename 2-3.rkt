#lang sicp

(define (square x) (* x x))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment s e)
  (cons s e))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-rectangle s h)
  (cons s h))

(define (height r)
  (cdr r))

(define (width r)
  (let ((s (car r)))
    (let ((start (start-segment s))
          (end (end-segment s)))
      (sqrt (+ (square (- (x-point start)
                          (x-point end)))
               (square (- (y-point start)
                          (y-point end))))))))

(define (perimiter r)
  (* 2 (+ (width r) (height r))))

(define (area r)
  (* (width r) (height r)))

(define rect (make-rectangle (make-segment (make-point 1.0 5.0)
                                           (make-point 9.0 2.0))
                             4.0))

(perimiter rect)
; 25.08

(area rect)
; 34.14
