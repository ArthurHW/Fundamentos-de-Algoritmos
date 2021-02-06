;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex16_combustivel) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; combustivel: numero numero -> string
;; dado o preço da gasolina e do alcool, retorna qual o combustivel mais viavel
;; de se utilizar
;; Exemplos:
;; (comsbustivel 6 3) = "álcool é mais viável"
;; (combustivel 4 4 = "gasolina é mais viável"
(define (combustivel gasolina alcool)
  (cond
    ;; se o preço do alcool for menor ou igual a 70% do preço da gasolina, alcool e mais viavel
    [(<= alcool (* 7/10 gasolina)) "alccol é mais viável"]
    ;;senão, gasolina e mais viavel
    [else "gasolina é mais viável"]))
(check-expect (combustivel 6 3) "alccol é mais viável")
(check-expect (combustivel 4 4) "gasolina é mais viável")
