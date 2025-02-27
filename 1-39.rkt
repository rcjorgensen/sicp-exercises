#lang sicp

(define (square x) (* x x))

(define (cont-frac n d k)
  (define (iter k result)
    (if (< k 1)
        result
        (iter (dec k) (/ (n k) (+ (d k) result)))))
  (iter k 0))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (-(square x))))
             (lambda (i) (- (* 2 i) 1))
             k))


(tan-cf 0 5)
(tan-cf 3.1415 5)
(tan-cf (/ 3.1415 2) 5)
(tan-cf (/ 3.1415 4) 5)

