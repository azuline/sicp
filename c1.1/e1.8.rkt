#lang sicp

(#%require expect)

(define (cbrt-iter guess x)
  (let ((new-guess (improve guess x)))
    (if (good-enough? new-guess guess)
        new-guess
        (cbrt-iter new-guess x))))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (square x) (* x x))

(define (good-enough? new-guess old-guess)
  (and (< new-guess (* old-guess 1.001))
       (> new-guess (* old-guess 0.999))))

(define (cube-root x) (cbrt-iter 1.0 x))

(define x (cube-root 8))
(expect! (and (> x 1.9999) (< x 2.0001)) expect-true)

(display "Passed\n")
