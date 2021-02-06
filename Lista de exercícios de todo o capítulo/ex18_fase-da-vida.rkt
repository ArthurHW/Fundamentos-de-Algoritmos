;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex18_fase-da-vida) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; fase-da-vida: numero -> string
;; dada a idade de uma pessoa, retorna em qu estágio da vida ela está
;; Exemplos:
;; (fase-da-vida 12) = "infância"
;; (fase-da-vida 17) = "juventude"
;; (fase-da-vida 30) = "fase adulta"
;; (fase-da-vida 68) = "terceira idade"
(define (fase-da-vida idade)
  (cond
    [(<= idade 12) "infância"]
    [(<= idade 28) "juventude"]
    [(<= idade 65) "fase adulta"]
    [else "terceira idade"]))
;; Testes:
(check-expect (fase-da-vida 10) "infância")
(check-expect (fase-da-vida 20) "juventude")
(check-expect (fase-da-vida 30) "fase adulta")
(check-expect (fase-da-vida 70) "terceira idade")
