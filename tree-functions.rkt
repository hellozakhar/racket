#lang racket

; HW07
; Напишите конструктор и селекторы для бинарного дерева,
; которое хранит данные (entry) в каждой вершине
; (define (make-leaf entry) ...)   ; дерево из одного листа
; (define (make-tree entry left right) ...)
; (define (entry tree) ...)        ; возвращает содержимое корня tree
; (define (left-branch tree) ...)  ; возвращает левое поддерево
; (define (right-branch tree) ...) ; возвращает правое поддерево
; (define (tree? tree) ...)        ; возвращает #t, если tree - дерево.

; Используя их, напишите следующие функции:
; (count-leaves tree)                  ; возвращает количество листьев в tree
; (fringe tree)                        ; возвращает список листьев дерева слева направо
; (tree-map f tree)                    ; возвращает дерево, где
                                       ; содержимое x каждой вершины заменено на (f x)
; (tree-fold leaf-func node-func tree) ; делает свертку tree. leaf-func применяется к содержимому
                                       ; каждого листа, а node-func к содержимому корня и результатам
                                       ; рекурсивных вызовов на поддеревьях

(define (make-leaf entry) (list entry))   ; дерево из одного листа
(define (make-tree entry left right)
  (list entry left right))
(define (entry tree) (car tree))          ; возвращает содержимое корня tree
(define (left-branch tree) (cadr tree))   ; возвращает левое поддерево
(define (right-branch tree) (caddr tree)) ; возвращает правое поддерево
(define (tree? tree)                      ; возвращает #t, если tree — дерево 
  (cond [(null? tree) #f]
        [(pair? tree) #t]
        [else #f]))

(define (count-leaves tree)
  (if (null? tree) 0 (+ 1 (count-leaves (cdr tree)))))

(define (fringe tree)
  (if (list? tree)
      (cons (fringe (left-branch tree)) (fringe (right-branch tree)))
      (list tree)))

(define (tree-map-my proc tree)
  (if (tree? tree)
      (cons (tree-map proc (car tree)) (tree-map proc (cdr tree)))
      (proc tree)))

;;;;;;; ARCHIVED ;;;;;;;;;

; (SICP 2.31)
; (tree-map f tree)
;(define (tree-map proc tree) 
;    (cond ((null? tree) null) 
;          ((not (pair? tree)) (proc tree)) 
;          (else (cons (tree-map proc (car tree)) (tree-map proc (cdr tree))))))