;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex14_maiorq100) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; maior100: numero -> numero
;; le um valor numerico, caso seja maior que 100 é dividido por 5, caso contrario
;; e multiplicado por 3
;; Exemplos:
;; (maior100 50) = 150
;; (maior100 105) = 21
(define (maior100 numero)
  (cond
    [(> numero 100) (/ numero 5)]
    [else (* numero 3)]))
(check-expect (maior100 50) 150)
(check-expect (maior100 105) 21)