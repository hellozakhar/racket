#lang racket

; HW05 Problem 4
; Напишите функцию (nub l), которая убирает из списка l элементы,
; встречающиеся второй и более раз. Элементы l могут иметь любой тип
; и не обязательно являются числами.

(define (nub l [temp '()])
  (cond [(empty? l) '()]
        [(member (car l) temp)
         (nub (cdr l) temp)]
        [else (cons (car l)
                    (nub (cdr l)
                           (cons (car l) temp)))]))

(nub (list '() (list 5 6 7) '() (cons 1 2) 3 4 (cons 1 2) 3 4 (list 5 6 7)))
;     '(() (5 6 7) () (1 . 2) 3 4 (1 . 2) 3 4 (5 6 7))
; =>  '(() (5 6 7) (1.2) 3 4)