#lang sicp

(define (cont-frac n d k)
  (define (iter k result)
    (if (< k 1)
        result
        (iter (dec k) (/ (n k) (+ (d k) result)))))
  (iter k 0))

(define e (+ (cont-frac (lambda (_) 1.0)
                        (lambda (i)
                          (if (= (remainder i 3) 2)
                              (* 2 (/ (+ i 1) 3))
                              1))
                        10)
             2))

e
