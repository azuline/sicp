#lang sicp

(#%require expect)

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (^ x p)
  (if (= p 1)
      x
      (* x (^ x (- p 1)))))

(expect! (^ 2 3) 8)
(expect! (^ 4 2) 16)

; This is a recursive function with three base cases and one recursive case.
;
; If y = 0, return 0.
; If x = 0, return 2 * y.
; If y = 1, return 2.
; Otherwise, recurse, where:
;   x = x - 1
;   y = A x (y - 1) ; This itself is a recursive call.

; This expect call reduces to
;   (A 0 (A 1 9))
;   (* 2 (A 1 9))
;   (* 2 (A 0 (A 1 8)))
;   (* 2 (* 2 (A 1 8)))
;   ...
;   (^ 2 10)
;
; Showing that (A 1 y) <=> 2^y
(expect! (A 1 10) (^ 2 10))

; This expect call reduces to
;   (A 1 (A 2 3))
;   (A 1 (A 1 (A 2 2)))
;   (A 1 (A 1 (A 1 (A 1 1))))
;   (A 1 (A 1 (A 1 2)))
;   (A 1 (A 1 (A 0 (A 1 1))))
;   (A 1 (A 1 (A 0 2)))
;   (A 1 (A 1 4)) ; We can reduce this from the pattern derived above.
;   (A 1 16)
;   2^16
;
; Showing that one of the following is potentially true...
;   (A 2 y) <=> 2^(2^y)
;   (A 2 y) <=> 2^(y^2)
;   (A 2 y) <=> 2^(y^2)
(expect! (A 2 4) (^ 2 (^ 4 2)))

; This expect call reduces to
;   (A 2 (A 3 2))
;   (A 2 (A 2 (A 3 1))
;   (A 2 (A 2 2))
;   (A 2 (A 1 (A 2 1)))
;   (A 2 (A 1 2))
;   (A 2 4)
(expect! (A 3 3) (A 2 4))

(display "Passed\n")

; f(n) = 2n
(define (f n) (A 0 n))
; g(n) = 2^n
(define (g n) (A 1 n))
; h(n) = 2^2^... (n times)
(define (h n) (A 2 n))
; k(n) = 5n^2
(define (k n) (* 5 n n))
