;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex23_salto_em_altura) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; ganhador?: Número Número Número -> String
;; dadas uma altura de uma barra de uma competição de salto em altura e o peso
;; de dois atletas A e V, determina o vencedor. A altura varia entre 1 e 2 metros
;; e o peso entre 50 e 90 kg
;; Exemplos:
;; (ganhador? 2 50 56) = "o atleta B é o vencedor"
;; (ganhador? 1.5 60 51) = "o atleta A é o vencedor"
;; (ganhador? 1.45 78 78) = "empate"
(define (ganhador? altura a b)
  (cond
    [(= a b) "empate"]
    [(> a b) "o atleta A é o vencedor"]
    [else "o atleta B é o vencedor"]))
;; Testes:
(check-expect (ganhador? 2 50 56) "o atleta B é o vencedor")
(check-expect (ganhador? 2 60 51) "o atleta A é o vencedor")
(check-expect (ganhador? 2 50 50) "empate")