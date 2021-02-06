;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.2.3.3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; total-profit : number -> number
;; calculates the total profit of a showing, 
;; given the number of people attending

;; EXAMPLES
;; if 5 people come, they make $2.50
;; if 2 people come, they lose $11.
;; if 100 people come, they make $430

(define (total-profit customers)
  (- (* 5 customers) (+ 20 (* .50 customers))))

;; EXAMPLES TURNED INTO TESTS

(check-expect (total-profit 5) 2.50)
(check-expect (total-profit 2) -11)
(check-expect (total-profit 100) 430)
