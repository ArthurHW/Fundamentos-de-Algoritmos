;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.2.4.4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; Execute this example in DrScheme.

(define (somef x)
  (sin x x))


;;1. then, type this in Interactions window: (somef 10 20)
;;error message: procedure somef: expects 1 argument, given 2: 10 20
;;meaning:       function contract was designed for one argument, 
;;               you gave two. Scheme gives an error for the function 
;;               call and not yet for the illegal use of sin function.

;;2. then, type this in Interactions window: (somef 10)
;;error message: sin: expects 1 argument, given 2: 10 10
;;meaning:       similar error but this time the sin function has 
;;               too many arguments in the function definition 
;;               for somef.