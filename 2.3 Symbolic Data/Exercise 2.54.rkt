#lang sicp

(display "Exercise 2.54 - Equality of lists of symbols") (newline)

(define (equal? a b)
  (cond ((or (and (symbol? a) (symbol? b) (eq? a b))
             (and (null? a) (null? b))) true)
        ((and (pair? a) (pair? b)) (and (equal? (car a) (car b))
                                        (equal? (cdr a) (cdr b))))
        (else false)))

(equal? '(this is a list) '(this is a list)) ; #t
(equal? '(this is a list) '(this (is a) list)) ; #f
(equal? '() '()) ; #t
(equal? 2 5) ; #f
(equal? 5 5) ; #f
(equal? 5 '(5)) ; #f
