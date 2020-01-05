#lang racket

; HW04 Problem 9
; Напишите функцию (nth l n), возвращающую n-ый элемент списка l.
; Голова списка имеет индекс 0. Можно считать, что n есть неотрицательное число,
; строго меньшее длины списка.

(define (nth lst n)
  (cond ((> n (sub1 (length lst))) (quote "Error! The index must be lower than length of list"))
        ((< n 0) (quote "Error! The index must be greater than or equal to zero"))
        (else (nth-func lst n))))

(define (nth-func lst n)
      (if (= n 0)
          (car lst)
          (nth-func (cdr lst) (- n 1))))

(define (test-nth)
  (nth '(1 2 10 25 99 125 1025 1024) 5))

(test-nth) ; => 125