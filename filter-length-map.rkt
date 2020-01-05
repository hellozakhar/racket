#lang racket

; HW06 Problem 4 (SICP 2.33)
; Напишите функции length, map и filter с помощью foldr, не используя рекурсию.

(define (length l)
  (foldr (lambda (x y) (+ 1 y)) 0 l))

(define (map p l)
  (foldr (lambda (x y) (cons (p x) y)) '() l))

(define (filter ps xs)
  (foldr (lambda (p y)
           (if (ps p)
               (cons p y)
               y))
         '()
         xs))

(length (list -4 -2 0 2 4 8 16 32 64 128 256 512 1024)) ; => 13
(filter positive? (list -4 -2 0 2 4 8 16 32 64 128 256 512 1024))
; => '(2 4 8 16 32 64 128 256 512 1024)