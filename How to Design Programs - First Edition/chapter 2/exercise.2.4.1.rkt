;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.2.4.1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; Execute these examples one at a time in DrScheme to see error messages for common mistakes.
 
;(+ (10) 20)

;;1.
;;error message: function call: expected a defined name or a 
;;               primitive operation name after an open parenthesis, 
;;               but found a number
;;meaning:       Scheme expects an operation after a parenthesis, 
;;               so parenthesizing the number is a mistake.

;(10 + 20)

;;2.
;;error message: function call: expected a defined name or a 
;;               primitive operation name after an open parenthesis, 
;;               but found a number
;;meaning:       10 is not a valid operation or a defined function
;;correction:    use prefix notation, not infix notation

(+ +)

;;3.
;;error message: this primitive operator must be applied to arguments; 
;;               expected an open parenthesis before the primitive 
;;               operator name
;;meaning:       Scheme expects arguments to follow an operator, 
;;               not another operator