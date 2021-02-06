;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex12_velocida_media) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; cvm(calcula-velocidade-média: Número Número Número Número -> Número
;; Obj: Dadas as posições inicial e final (em quilômetros) e os tempos inicial
;; e final (em horas), respectivamente,  calcula a velocidade média do veículo
;; (em km/h)
;; Exemplos:
;; (cvm 10 20 0 2) = 5
;; (cvm 40 560 0 8) = 65
;; (cvm 20 260 5 8) = 80
(define (cvm posicao_inicial posicao_final tempo_inicial tempo_final)
  (/
   (- posicao_final posicao_inicial)
   (- tempo_final tempo_inicial)))
;; Testes:
(check-expect (cvm 10 20 0 2) 5)
(check-expect (cvm 40 560 0 8) 65)
(check-expect (cvm 20 260 5 8) 80)
