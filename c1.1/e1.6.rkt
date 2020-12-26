#lang sicp

; When Alyssa attempts to use `new-if`, her program will not terminate.
;
; Functions use applicative-order evaluation, so both the `then` and `else`
; clauses will be evaluated at the time of the function call. As the `else`
; clause is recursive, this will invoke infinite recursion.
