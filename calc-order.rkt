#lang racket
(require racket/trace) ; для (trace ...)

; HW10 Problem 4 (SICP 3.8)
; Когда в разделе 1.1.3 мы определяли модель вычислений, мы сказали, что первым шагом при
; вычислении выражения является вычисление его подвыражений. Однако мы нигде не указали
; порядок, в котором проходит вычисление подвыражений (слева направо или справа налево). Когда
; мы вводим присваивание, порядок, в котором вычисляются аргументы процедуры, может повли-
; ять на результат. Определите простую процедуру f, так, чтобы вычисление (+ (f 0) (f 1))
; возвращало 0, если аргументы + вычисляются слева направо, и 1, если они вычисляются справа
; налево.

(define f
  (let ((s -1))
    (lambda (x)
      (if (= s -1)
          (begin (set! s x) s)
          s))))

; Для ясности добавим трассировку

(trace f)
(+ (f 0) (f 1))
; >(f 0)
; <0
; >(f 1)
; <0
; 0