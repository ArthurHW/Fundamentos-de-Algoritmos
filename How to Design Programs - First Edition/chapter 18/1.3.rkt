;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |1.3|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;; Language: Intermediate Student

#| 18.1.3
------------------------------------------------------------
1. NOT Legal
(define A-CONSTANT
  (not 
   (local ((define (odd an)
             (cond
               [(= an 0) false]
               [else (even (- an 1))]))
           (define (even an)
             (cond
               [(= an 0) true]
               [else (odd (- an 1))])))
     (even a-nat-num))))

The name a-nat-num has not been defined.

2. Legal
(+ (local ((define (f x) (+ (* x x) (* 3 x) 15))
           (define x 100)
           (define f@100 (f x)))
     f@100)
   1000)

This uses correct syntax.

3.NOT Legal
(local ((define CONST 100)
        (define f x (+ x CONST)))
  (define (g x y z) (f (+ x (* y z)))))

The definition (define f x (+ x CONST)) is not syntactically
correct. Also, the body of the local is a definition when
it should be an expression.
|#