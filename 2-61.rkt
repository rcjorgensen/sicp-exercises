#lang sicp

(display "Exercise 2.61 - Adjoin for ordered representation") (newline)

(define (adjoin-set x set)
  (cond ((or (null? set)
             (< x (car set)))
         (cons x set))
        ((= x (car set)) set)
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(adjoin-set 1 '())
(adjoin-set 1 '(1 2 3))
(adjoin-set 2 '(1 2 3))
(adjoin-set 1 '(2 3))
(adjoin-set 2 '(1 3))
(adjoin-set 3 '(1 2))
