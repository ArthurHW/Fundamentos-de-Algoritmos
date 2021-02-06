;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.2.2.5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; program with simple formulas

(define (f n)
  (+ (/ n 3) 2))

(check-expect (f 2) 8/3)
(check-expect (f 5) 11/3)
(check-expect (f 9) 5)

;; 1.

(define (g n)
  (+ (* n n) 10))
(check-expect (g 2) 14)
(check-expect (g 9) 91)

;; 2.

(define (h n)
  (+ (* 1/2 n n) 20))
(check-expect (h 2) 22)
(check-expect (h 9) 60.5)

;; 3.

(define (z n)
  (- 2 (/ 1 n)))
(check-expect (z 2) 1.5)
(check-expect (z 9) 17/9)
