#lang sicp

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

#| (test 0 (p)) |#

; In applicative-order-evaluation, the call will not terminate, as `p` is an
; infinite loop. In normal-order-evaluation, the call will return `0`, as `p`
; is never evaluated.
