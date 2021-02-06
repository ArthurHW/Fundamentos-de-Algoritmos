;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; how-many : number number number -> number
;; computes the number of solutions a quadratic equation with
;; coefficients a, b, and c.

;; EXAMPLES
;; x^2 + 2x + 1 = 0 has 1 solution
;; 2x^2 + 4x + 1 = 0 has 2 solutions
;; 2x^2 + 4x + 3 = 0 has no solutions
;; x^2 - 1 = 0 has no solutions
;; 2x^2 + 4x + 2 = 0 has 1 solution
(define (how-many a b c)
  (cond
    [(> (discriminant a b c) 0) 2]
    [(= (discriminant a b c) 0) 1]
    [(< (discriminant a b c) 0) 0]))

;; discriminant : number number number -> number
;; computes the discriminant of the quadratic equation with
;; coefficients a, b, and c.

;; EXAMPLES
;; the discriminant of x^2 + 2x + 1 = 0 is 0
;; the discriminant of 2x^2 + 4x + 1 = 0 is 8
;; the discriminant of 4x^2 + 4x + 3 = 0 is -8

(define (discriminant a b c)
  (- (* b b) (* 4 a c)))

;; EXAMPLES TURNED INTO TESTS

(check-expect (discriminant 1 2 1) 0)
(check-expect (discriminant 2 4 1) 8)
(check-expect (discriminant 2 4 3) -8)

(check-expect (how-many 1 2 1) 1)
(check-expect (how-many 2 4 1) 2)
(check-expect (how-many 2 4 3) 0)
(check-expect (how-many 1 0 -1) 2)
(check-expect (how-many 2 4 2) 1)