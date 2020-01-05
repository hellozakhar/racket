#lang racket

; HW05 Problem 3
; Напишите функцию (flatten l), которая принимает пару или список l
; и возвращает список всех значений, не являющихся парами,
; в том порядке, в котором они встречаются в l. Например:
; > (flatten '((1 . 2) () ((3 4) 5)))
; '(1 2 3 4 5)

(define (flatten lst)
  (cond ((null? lst) '())
        ((pair? lst)
         (append (flatten (car lst))
                 (flatten (cdr lst))))
        (else (list lst))))

(flatten (list (cons 1 2) '() (list (list 3 4) (list 5)))) ; => '(1 2 3 4 5)