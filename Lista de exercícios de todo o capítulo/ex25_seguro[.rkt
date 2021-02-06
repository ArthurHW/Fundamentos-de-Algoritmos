;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ex26_seguro[|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; valor_seguro Número Número Booleano -> Número
;; Dado o ano de fabricação de um veículo, a idade do proprietário e um valor
;; booleano representando se o carro é usado para trabalho, calcula o valor do
;; seguro do mesmo
;; Exemplos:
;; (valor_seguro 2010 35 true) = 1850
;; (valor_seguro 1999 22 false = 2800
;; (valor-seguro 2015 24 true) = 2650
(define (valor_seguro ano_carro idade trab)
  (+ (cond
       [(< ano_carro 2000) 2000]
       [else 1200])
     (cond
       [(< idade 25) 800]
       [else 0])
     (cond
       [trab 650]
       [else 0])))
;; Testes:
(check-expect (valor_seguro 2010 35 true) 1850)
(check-expect (valor_seguro 1999 22 false) 2800)
(check-expect (valor_seguro 2015 24 true) 2650)