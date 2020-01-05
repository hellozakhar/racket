#lang racket

; HW04 Problem 4
; Напишите функцию (snoc l a), добавляющую элемент a в конец списка l.
; Функция возвращает новый список, потому что у нас пока не было процедур,
; меняющих существующий список.

(define (snoc lst elem) 
   (if (null? lst)                        ; "null?" returns #t, if list is empty
       (list elem)                        ; if list empty, we create a list with elem
       (cons (car lst)
             (snoc (cdr lst) elem))))

(define (test-snoc)     ;    '(1 2 3 4) '5
  (snoc '(1 2 3 4) '5)) ; => '(1 2 3 4 5)

(test-snoc)