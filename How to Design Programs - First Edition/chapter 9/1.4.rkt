;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; A list-of-2-symbols is:
;;  (cons x (cons y empty))
;; where x is a symbol and y is a symbol

;; Examples:
(cons 'doll (cons 'rocket empty))
(cons 'candy (cons 'doll empty))
(cons 'candy (cons 'rocket empty))

;; contains-2-doll? : list-of-2-symbols -> boolean
;; returns true if the symbol 'doll is in the input list and
;; false otherwise

#|
;; Template
(define (constains-2-doll? a-lo2s)
  (first a-lo2s)
  (first (rest a-lo2s)))
|#

(define (contains-2-doll? a-lo2s)
  (or (eq? 'doll (first a-lo2s))
      (eq? 'doll (first (rest a-lo2s)))))

;; Examples:

(contains-2-doll? (cons 'doll (cons 'rocket empty))) "should be" true
(contains-2-doll? (cons 'candy (cons 'doll empty))) "should be" true
(contains-2-doll? (cons 'candy (cons 'rocket empty))) "should be" false