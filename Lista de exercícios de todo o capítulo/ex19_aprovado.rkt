;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex19_aprovado) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; calcula-media numero numero numero numero -> numero
;; dadas as 4 notas de um aluno, calcula sua media aritmetica simplse
;; Exemplos:
;; (calcula-media 4 4 4 4) = 4
;; (calcula-media 6 6 8 8) = 7
(define (calcula-media n1 n2 n3 n4)
  (/ ( + n1 n2 n3 n4) 4))
;; Testes:
(check-expect (calcula-media 4 4 4 4) 4)
(check-expect (calcula-media 6 6 8 8) 7)

;; aprovado?: numero numer numero numero -> símbolo
;; dadas as 4 notas do aluno, devolve se ele foi aprovado,  reprovado, ou
;; se terá de prestar exame
;; Exemplos:
;; (aprovado? 4 4 4 4) = 'Reprovado
;; (aprovado? 6 6 8 8) = 'Aprovado
(define (aprovado? n1 n2 n3 n4)
  (cond
    [(< (calcula-media n1 n2 n3 n4) 5) 'Reprovado]
    ((< (calcula-media n1 n2 n3 n4) 7) 'Exame)
    [else 'Aprovado]))
;; Testes:
(check-expect (aprovado? 4 4 4 4) 'Reprovado)
(check-expect (aprovado? 6 6 5 5) 'Exame)
(check-expect (aprovado? 8 8 8 8) 'Aprovado)
