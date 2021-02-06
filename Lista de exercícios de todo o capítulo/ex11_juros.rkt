;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex11_juros) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; mes2ano: numero -> numero
;; dado um numero de meses, converte para o equivalente em anos
;; Exemplos:
;; (mes2ano 12) = 1
;; (mes2 ano 18) = 1.5
(define (mes2ano meses)
  (/ meses 12))
; Testes:
(check-expect (mes2ano 12) 1)
(check-expect (mes2ano 18) 1.5)

;; ano2mes: numero -> numero
;; dado um numero de anos, converte para o equivalente em meses
;; Exemplos:
;; (ano2mes 1) = 12
;; (ano2mes 1.5) = 18
(define (ano2mes anos)
  ( * 12 anos))
;; Testes:
(check-expect (ano2mes 1) 12)
(check-expect (ano2mes 1.5) 18)

;; mensal2anual: numero -> numero
;; dada uma taxa de juros mensal (em decimal) , comverte para uma taxa anual equivalente
;; Exemplos:
;; (mensal2anual 0.01) = 0.12
;; (mensal2anual 0.015) = 0.18
(define (mensal2anual taxa)
  (* 12 taxa))
;; Testes:
(check-expect (mensal2anual 0.01) 0.12)
(check-expect (mensal2anual 0.015) 0.18)

;; anual2mensal: numero -> numero
;; dada uma taxa de juros anual (em decimal), converte para uma taxa mensal equivalente
;; Exemplos:
;; (anual2mensal 0.12) = 0.01
;; (anual2mensal 0.18) = 0.015
(define (anual2mensal taxa)
  (/ taxa 12))
;; Testes:
(check-expect (anual2mensal 0.12) 0.01)
(check-expect (anual2mensal 0.18) 0.015)

;; =============================================================================

;;(a) Um indivíduo investiu $ 35.000,00 em uma aplicação durante 1 semestre à
;; taxa de juros simples de 18,68% a.a. Em quanto o capital foi aumentado
;; ao final do período?

;; calcula-totalm: numero -> numero
;; dado o capital investido, a taxa de juros mensal (em decimal) e o tempo
;; decorrido (em meses) , retorna o montante final
;; Exemplos:
;; (calcula-totalm 1000 0.01 1) = 1010
;; (caculta-totalm 1000 0.2 2) = 1400
(define (calcula-totalm capital taxa meses)
  (* capital (+ 1 (* taxa meses))))
;; Testes:
(check-expect (calcula-totalm 1000 0.01 1) 1010)
(check-expect (calcula-totalm 1000 0.2 2) 1400)

"Resposta (a):"
(calcula-totalm 35000 (anual2mensal 0.1868) 6)

;; ==============================================================================
;;(b) Em um período total de 2,5 anos, um capital de $ 12.200,00 foi aplicado
;; à uma taxa de juros de 7,2% a.m. Determine o montante ao final do período.

"Resposta (b):"
(calcula-totalm 12200 0.072 (ano2mes 2.5))






