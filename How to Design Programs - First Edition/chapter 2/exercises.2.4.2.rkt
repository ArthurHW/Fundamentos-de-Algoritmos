;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercises.2.4.2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; Execute these examples one at a time in DrScheme to see 
;; error messages for common mistakes.
 
;(define (f 1)
; (+ x 10))
(define (f x)
  (+ x 10))

;;1.
;;error message: define: expected a name for the function's 1st argument, 
;;               but found a number
;;meaning:       the parameter following the function name 
;;               must be a variable name

; (define (g x)
; + x 10)
(define (g x)
  (+ x 10))

;;2.
;;error message: +: this primitive operator must be applied 
;;               to arguments; expected an open parenthesis 
;;               before the primitive operator name
;;meaning:       the function g is defined with x as a parameter, 
;;               but the + operator needs to follow a parenthesis. 
;;               To fix you will need to add parentheses.

; define h(x) 
;  (+ x 10))
(define (h x)
  (+ x 10))

;;3.
;;error message: define: found a use of `define' that does 
;;               not follow an open parenthesis
;;meaning:       define is a primitive function and therefore 
;;               needs to follow an open parenthesis.


