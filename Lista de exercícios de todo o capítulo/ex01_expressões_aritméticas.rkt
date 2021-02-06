;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex01_expressões_aritméticas) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;1) f(n) = (n/3) + 2
(define (f n)
  (+ (/ n 3) 2))

;(a) g(n) = n² + 10
(define (g n)
  (+ (sqr n) 10))

;(b) h(n) = (1/2)n² + 20
(define (h n)
  (+ (* 1/2 (sqr n)) 20))

;(c) 2 - (1/n)
(define (j n)
  (- 2 (/ 1 n)))

 