;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;; how-many : number number number -> symbol
;; computes the number of solutions a quadratic equation with
;; coefficients a, b, and c.
(define (how-many a b c)
  (cond
    [(= a 0) 'degenerate]
    [(> (discriminant a b c) 0) 'two]
    [(= (discriminant a b c) 0) 'one]
    [(< (discriminant a b c) 0) 'none]))

;; discriminant : number number number -> number
;; computes the discriminant of the quadratic equation with
;; coefficients a, b, and c.
(define (discriminant a b c)
  (- (* b b) (* 4 a c)))

;; Examples

(check-expect (discriminant 1 2 1) 0)
(check-expect (discriminant 2 4 1) 8)
(check-expect (discriminant 2 4 3) -8)

(check-expect (how-many 1 2 1) 'one)
(check-expect (how-many 2 4 1) 'two)
(check-expect (how-many 2 4 3) 'none)
(check-expect (how-many 1 0 -1) 'two)
(check-expect (how-many 2 4 2) 'one)
(check-expect (how-many 0 1 1) 'degenerate)