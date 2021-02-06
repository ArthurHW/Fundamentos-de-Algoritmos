;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex21_IMC) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; calcula-imc: numero numero -> numero
;; dado o peso e a alutara de um individuo, retorna o seu IMC
;; Exemplos:
;; (calcula-imc 60 1.75) = 20.8979...
;; (calcula-imc 60 1.5) = 26.6666...
(define (calcula-imc peso altura)
  (/ peso (* altura altura)))
;; Testes:
(check-expect (calcula-imc 80 2) 20)
(check-expect (calcula-imc 40 1) 40)

;; situacao-imc: numero numero -> String
;; dado o peso e a altura de um individuo, retorna a situação da pessoa
;; de acordo com o seu IMC
;; Exemplos:
;; (situacao-IMC 60 1.75) = "Peso normal"
;; (situacao-IMC 60 1.5) = "Acima do peso"
(define (situacao-imc peso altura)
  (cond
    [(< (calcula-imc peso altura) 18) "Abaixo do peso"]
    [(< (calcula-imc peso altura) 25) "Peso normal"]
    [(< (calcula-imc peso altura) 30) "Acima do peso"]
    [else "Obesidade"]))
;; Testes: 
(check-expect (situacao-imc 80 2) "Peso normal")
(check-expect (situacao-imc 60 1.5) "Acima do peso")
(check-expect (situacao-imc 40 1) "Obesidade")
(check-expect (situacao-imc 40 1.8) "Abaixo do peso")
