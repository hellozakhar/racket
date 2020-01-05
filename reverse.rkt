#lang racket

; HW04 Problem 5
; Напишите функцию reverse, возвращающую список элементов в обратном порядке.
; Ваша функция использует хвостовую или нехвостовую рекурсию?
; Какова сложность функции с точностью до О-большого,
; измеряемая в количестве вызовов cons в зависимости от длины списка?

(define (reverse lst)
  (reverse-func lst '()))

(define (reverse-func lst acc)
  (if (null? lst)                         ; if the list is empty
      acc                                 ; return the accumulator
      (reverse-func (cdr lst)             ; advance the recursion over the list
                   (cons (car lst) acc)))); cons current element with accumulator

(define (test-reverse)
  (reverse '(1 4 16 64)))

(test-reverse)