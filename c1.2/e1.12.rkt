#lang sicp

(#%require expect)

(define (pascal-triangle row col)
  (cond ((= row 0) 1)
        ((= col 0) 1)
        ((= row col) 1)
        (else (+ (pascal-triangle (- row 1) (- col 1)) (pascal-triangle (- row 1) col)))))

(expect! (pascal-triangle 0 0) 1)
(expect! (pascal-triangle 2 1) 2)
(expect! (pascal-triangle 4 2) 6)

(display "Passed\n")
