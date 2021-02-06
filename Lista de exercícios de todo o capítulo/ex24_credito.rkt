;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex24_credito) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; credito?: Número Número -> String
;; dado o tempo que o indivíduo é cliente (em meses) e a sua renda mensal,
;; retorna a situação da concessão de credito desse cliente
;; Exemplos:
;; (credito? 10 1100) = "negado"
;; (credito? 10 1300) = "em análise"
;; (credito? 10 2500) = "aprovado"
;; (credito? 13 1100) = "em análise"
;; (credito? 13 1300 = "aprovado"
;; (credito? 13 2500) = "aprovado"
(define (credito? months money)
  (cond
    [(<= months 12) (cond
                      [(< money 1200) "negado"]
                      [(< money 2300) "em análise"]
                      [else "aprovado"])]
    [else (cond
            [(< money 1200) "em análise"]
            [else "aprovado"])]))
;; Testes:
(check-expect (credito? 10 1100) "negado")
(check-expect (credito? 10 1300) "em análise")
(check-expect (credito? 10 2500) "aprovado")
(check-expect (credito? 13 1100) "em análise")
(check-expect (credito? 13 1300) "aprovado")
(check-expect (credito? 13 2500) "aprovado")
