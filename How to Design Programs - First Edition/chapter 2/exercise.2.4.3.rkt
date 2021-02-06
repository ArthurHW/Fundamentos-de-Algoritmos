;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.2.4.3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; Execute these examples one at a time in DrScheme to see 
;; error messages for common mistakes.

(+ 5 (/ 1 0))

;;1.
;;error message: /: division by zero
;;meaning:       rather than crashing, Scheme warns of 
;;               the division by zero

(sin 10 20)

;;2.
;;error message: sin: expects 1 argument, given 2: 10 20
;;meaning:       function contract was designed for one argument, 
;;               but you gave two

(somef 10)

;;3.
;;error message: reference to undefined identifier: somef
;;meaning:       the function someof has not previously been defined