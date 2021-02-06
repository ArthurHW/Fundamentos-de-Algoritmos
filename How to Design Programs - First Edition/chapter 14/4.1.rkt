;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.1|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
#|

A scheme-expression is either:

  - number,
  - symbol,
  - (make-add scheme-expression scheme-expression)
  - (make-mul scheme-expression scheme-expression)

|#

(define-struct add (lhs rhs))
(define-struct mul (lhs rhs))

;; EXAMPLES

;; 1. (+ 10 -10) 
(make-add 10 -10)

;; 2. (+ (* 20 3) 33) 
(make-add (make-mul 20 3) 33)

;; 3. (* 3.14 (* r r)) 
(make-mul 3.14 (make-mul 'r 'r))

;; 4. (+ (* 9/5 c) 32) 
(make-add (make-mul 9/5 'c) 32)

;; 5. (+ (* 3.14 (* o o)) (* 3.14 (* i i)))���
(make-add (make-mul 3.14 (make-mul 'o 'o))
          (make-mul 3.14 (make-mul 'i 'i)))