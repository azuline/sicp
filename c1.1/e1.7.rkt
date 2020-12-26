#lang sicp

(#%require expect)

(define (sqrt-iter guess x)
  (let ((new-guess (improve guess x)))
    (if (good-enough? new-guess guess)
        new-guess
        (sqrt-iter new-guess x))))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? new-guess old-guess)
  (and (< new-guess (* old-guess 1.001))
       (> new-guess (* old-guess 0.999))))

(define (new-sqrt x) (sqrt-iter 1.0 x))

; For small numbers, our guess of `0.001` is inadequate.
; For large numbers, very long runtime and eventual stack overflow!

#| (new-sqrt 0.00001) |#
#| (new-sqrt 91040921803132410841842148190) |#

(define x (new-sqrt 0.00001))
(expect! (and (> x 0.003) (< x 0.004)) expect-true)

; As long as this doesn't hang forever...
(display "Please terminate...\n")
(new-sqrt 91040921803132410841842148190)

(display "Passed\n")
