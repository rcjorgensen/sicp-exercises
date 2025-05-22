#lang sicp

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  ;; We need the helper function `decode-1` because we need to keep `tree` around for when a symbol has been decoded and we start again from the root.
  ;; If we didn't have the helper, `tree` would be replaced by its children in the recursion.
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree)) ;; Now we start over decoding `tree` with the remaining bits
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))




(display "Decoding the Figure 2.18 tree") (newline)

(define example-tree
  (make-code-tree (make-leaf 'A 8)
                  (make-code-tree
                   (make-code-tree
                    (make-leaf 'B 3)
                    (make-code-tree
                     (make-leaf 'C 1)
                     (make-leaf 'D 1)))
                   (make-code-tree
                    (make-code-tree
                     (make-leaf 'E 1)
                     (make-leaf 'F 1))
                    (make-code-tree
                     (make-leaf 'G 1)
                     (make-leaf 'H 1))))))

(define example-message '(1 0 0 0 1 0 1 0))

(decode example-message example-tree)



(display "Exercise 2.67 - Decoding samples") (newline)

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)
;; (A D A B B C A)
