#lang racket
(require r5rs)
(print-as-expression #f)
(print-mpair-curly-braces #f)

; HW09 Problem 3
; Напишите следующие функции.
; а) (add-last! x l) добавляет x в конец списка l, изменяя l,
;    а не создавая новый список.
; б) (delete! x l) удаляет первое вхождение x в списке l, при этом изменяя список,
;    а не создавая новый.
; в) (append! l1 l2) соединяет списки l1 и l2, изменяя l1 и не создавая новый список.

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (add-last! x l)
  (set-cdr! (last-pair l) (cons x '()))
  l)

(define (append! l1 l2)
  (set-cdr! (last-pair l1) l2)
  l1)

(add-last! 5 '(1 2 3 4))             ; => (1 2 3 4 5)
(append! '(1 2 3 4) '(5 6 7 8))      ; => (1 2 3 4 5 6 7 8)