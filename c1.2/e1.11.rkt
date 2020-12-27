#lang sicp

(#%require expect)

(define (f1 n)
  (cond ((< n 3) n)
        (else (+      (f1 (- n 1))
                 (* 2 (f1 (- n 2)))
                 (* 3 (f1 (- n 3)))))))

(define (f2 n) 
  (if (< n 3) n
              (f-iter 2 1 0 (- n 3))))

; `x` is f(n - 1)
; `y` is f(n - 2)
; `z` is f(n - 3)
; `n` is the number of iterations remaining
(define (f-iter x y z n)
  (let ((result (+ x (* 2 y) (* 3 z))))
    (if (= 0 n) result
                (f-iter result x y (- n 1)))))

(define (f_eq n) (expect! (f1 n) (f2 n)))

(f_eq 1)
(f_eq 2)
(f_eq 3)
(f_eq 4)
(f_eq 5)
(f_eq 6)
(f_eq 7)
(f_eq 8)
(f_eq 9)
(f_eq 10)

(display "Passed\n")
