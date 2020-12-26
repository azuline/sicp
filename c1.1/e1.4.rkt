#lang sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; This procedure returns `a + b` if `b` is greater than `0`, otherwise `a - b`.
; It is functionally equivalent to `a + |b|`.
