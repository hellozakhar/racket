#lang racket

; HW05 Problem 5
; Напишите функцию (merge l1 l2), которая сливает упорядоченные списки чисел l1 и l2 в один.
; Например,
; > (merge '(2, 5, 6) '(1, 3, 4))
;   '(1, 2, 3, 4, 5, 6)
;
; Напишите функцию (halve l), которая разбивает список l на две половины,
; длины которых отличаются не более, чем на единицу, и возвращает пару,
; составленную из этих половин. В определении можно использовать стандартные функции.
; Используя merge и halve, напишите функцию (msort l), реализующую сортировку слиянием.
; Она разбивает список l пополам, рекурсивно сортирует половины и затем сливает их в один список.

(define (merge l1 l2)
  (if (null? l1) l2
      (if (null? l2) l1
          (if (< (car l1) (car l2))
              (cons (car l1) (merge (cdr l1) l2))
              (cons (car l2) (merge (cdr l2) l1))))))

; Issue: add if lst is empty return '() else run this
; quotient
(define (halve lst)
  (define half-length (/ (length lst) 2))
  (cond [(= half-length 0) (quote "List is empty.")]
        [(integer? (inexact->exact half-length))
         (cons (take lst half-length) (drop lst half-length))]
        [else (cons (take lst (- half-length 1/2))
                    (drop lst (- half-length 1/2)))]))

(define (msort lst)
  (cond
    [(null? lst) '()]
    [(null? (cdr lst)) lst]
    [else (define l (halve lst))
          (merge (msort (car l))
                 (msort (cdr l)))]))

(msort '(128 3 5 1 64 1024 512 100 10 25 9)) ; => '(1 3 5 9 10 25 64 100 128 512 1024)

