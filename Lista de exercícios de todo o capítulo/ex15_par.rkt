;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex15_par) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; par?: numero -> numero
;; recebe um inteiro e se for par divide por 2, caso seja impar soma 1 e depois
;; divide por 2
;; exemplos:
;; (par? 2) = 1
;; (par? 5) = 3
(define (par? n)
  (cond
    [(= (remainder n 2) 0) (/ n 2)]
    [else (/ (+ n 1) 2)]))
;; Testes:
(check-expect (par? 2) 1)
(check-expect (par? 5) 3)