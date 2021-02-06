;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; how-many-symbols : list-of-symbols -> number
;; counts the number of symbols on a-list-of-symbols
#|
;; Template
(define (how-many-symbols a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) ...]
    [else ... (first a-list-of-symbols) ...
          ... (how-many-symbols (rest a-list-of-symbols)) ...]))
|#

(define (how-many-symbols a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) 0]
    [else (+ 1 (how-many-symbols (rest a-list-of-symbols)))]))

;; Examples:

(how-many-symbols empty) "should be" 0
(how-many-symbols (cons 'doll empty)) "should be" 1
(how-many-symbols (cons 'doll (cons 'rocket (cons 'telephone empty)))) "should be" 3

;; how-many-numbers : list-of-numbers -> number
;; counts the number of symbols on a-list-of-numbers
#|
;; Template
(define (how-many-numbers a-list-of-numbers)
  (cond
    [(empty? a-list-of-numbers) ...]
    [else ... (first a-list-of-numbers) ...
          ... (how-many-numbers (rest a-list-of-numbers)) ...]))
|#

(define (how-many-numbers a-list-of-numbers)
  (cond
    [(empty? a-list-of-numbers) 0]
    [else (+ 1 (how-many-numbers (rest a-list-of-numbers)))]))

;; Examples:

(how-many-numbers empty) "should be" 0
(how-many-numbers (cons 10 empty)) "should be" 1
(how-many-numbers (cons 2 (cons 3 (cons 5 empty)))) "should be" 3

;; The only difference is the name of the function and the data it processes.
;; The functions themselves are identical!