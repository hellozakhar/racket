#lang racket

; HW06 Problem 3 (SICP 2.38)
; Напишите foldr и foldl. Используйте хвостовую рекурсию для foldl.
; PS foldr (fold-right) known as accumulate (SICP).

(define (foldr f x0 l)
  (if (null? l)
      x0
      (f (car l)
         (foldr f x0 (cdr l)))))

(define (foldl f x0 l)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (f result (car rest))
              (cdr rest))))
  (iter x0 l))