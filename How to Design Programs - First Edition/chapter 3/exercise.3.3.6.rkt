;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.3.3.6) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; fahrenheit->celsius : number -> number
;; computes the celsius equivalent of t
(define (fahrenheit->celsius t)
  (* 5/9 (- t 32)))

;; celsius->fahrenheit : number -> number
;; computes the farenheit equivalent of t
(define (celsius->fahrenheit t)
  (+ (* 9/5 t) 32))

;; I : number -> number
;; to convert a Fahrenheight temperature to Celsuis and back
(define (I f)
  (celsius->fahrenheit (fahrenheit->celsius f)))

;; EXAMPLES AS TESTS
(check-expect (I 32) 32)

;; these two function compose to produce the identity
;; function on numbers. 
;; That is, a function that always returns I always returns
;; its input.