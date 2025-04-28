#lang sicp

; Exercise 2.54
; Define `equal?` recursively in terms of `eq?` by saying `a` and `b` are `equal?`
; if they are both symbols and the symbols are `eq?`, or if they are both lists
; such that `(car a)` is `equal?` to `(car b)` and `(cdr a)` is equal to `(cdr b)`.

(define (equal? a b)
  (cond ((and (null? a) (null? b)) true)
        ((and (pair? a) (pair? b)) (and (equal? (car a) (car b))
                                        (equal? (cdr a) (cdr b))))
        (else (eq? a b))))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
(equal? '() '())
(equal? 2 5)
(equal? 5 5)
(equal? 5 '(5))

