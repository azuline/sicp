#lang sicp

(#%require expect)

(define x (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
             (* 3 (- 6 2) (- 7 2))))

(expect! x (/ 37 150))

(display "Passed\n")
