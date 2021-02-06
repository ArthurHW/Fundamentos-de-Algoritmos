;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex13_posicao_final) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; cpf(calcula-posição-final): Número Número Número Número -> Número
;; Obj: Dados a velocidade média de um veículo (em km/h), sua posição inicial
;; (em km) e os instantes inicial e final de tempo (em horas), calcula a posição
;; final deste veículo (em km)
;; Exemplos:
;; (cpf 5 10 0 2) = 5
;; (cpf ) = 560
;; (cpf 5 10 0 2) = 260
(define (cpf velocidade_media posicao_inicial tempo_inicial tempo_final)
  (+ (* velocidade_media (- tempo_final tempo_inicial)) posicao_inicial))
;;Testes:
(check-expect (cpf 5 10 0 2) 20)
(check-expect (cpf 65 40 0 8) 560)
(check-expect (cpf 80 20 5 8) 260)
