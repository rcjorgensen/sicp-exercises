#lang sicp

(display "Exercise 2.55 - Quote comprehension check") (newline)

; The following expressions are all the same with different syntax
''(abracadabra)
'(quote (abracadabra))
(list 'quote '(abracadabra))

; So
(car ''(abracadabra))
(car '(quote (abracadabra)))
(car (list 'quote '(abracadabra)))
; all return the symbol quote
