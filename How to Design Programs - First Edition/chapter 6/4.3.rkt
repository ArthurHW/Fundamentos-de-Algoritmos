;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; a letter is a symbol, one of 'a ... 'z.

;; a word is
;;   (make-word FIRST SECOND THIRD)
;; where FIRST is a letter,
;;       SECOND is a letter, and
;;       THIRD is a letter.
(define-struct word (first second third))

;; DATA EXAMPLES

(make-word 'a 'p 'e)
(make-word 'b 'i 'g)
(make-word 'c 'a 't)
(make-word 'd 'o 'g)
(make-word 'e 'l 'm)
(make-word 'f 'i 't)
(make-word 'g 'a 's)