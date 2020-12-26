#lang sicp

(#%require expect)

(define (square x) (* x x))
(define (sum-two-squares x y) (+ (square x) (square y)))

(define (f x y z)
  (cond ((and (<= x y) (<= x z)) (sum-two-squares y z))
        ((and (<= y x) (<= y z)) (sum-two-squares x z))
        (else (sum-two-squares x y))))

(expect! (f 1 2 3) 13)
(expect! (f 3 2 1) 13)
(expect! (f 1 2 1) 5)

(display "Passed\n")
