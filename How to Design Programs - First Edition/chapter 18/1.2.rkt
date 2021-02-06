;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |1.2|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;; Language: Intermediate Student

#| 18.1.2
------------------------------------------------------------

1. 
(local ((define x 10)
        (y (+ x x)))
  y)

The sequence following the keyword local is to contain only
definitions. (y (+ x x)) is not a definition. 

2.
(local ((define (f x) (+ (* x x) (* 3 x) 15))
        (define x 100)
        (define f@100 (f x)))
  f@100 x)

After the definition sequence there can be only one experession.
f@100 x is not a single expression.

3.
(local ((define (f x) (+ (* x x) (* 3 x) 14))
        (define x 100)
        (define f (f x)))
  f)

Each name may occur at most once on the left-hand side. 
Here f occurs on the left-hand side in the first and
third definition.
|#