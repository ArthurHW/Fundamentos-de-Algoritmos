;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cap9) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; ==============================================================================
;; 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

;; Uma Lista-de-valores é ou
;; 1. a lista vazia empty, ou
;; 2. (cons n ldv), onde
;; s : Número e
;; ldv : Lista-de-valores

;; valor-total: Lista-de-valores -> Número
;; dada uma lista de valores soma eles
;; Exemplos:
;; (valor-total empty) = 0
;; (valor-total (cons 50 empty)) = 50
;; (valor-total (cons 20 (cons 10 empty))) = 30
(define (valor-total lista)
  (cond
    [(empty? lista) 0]
    [else (+ (first lista)
             (valor-total (rest lista)))]))
;; Testes:
(check-expect (valor-total empty) 0)
(check-expect (valor-total (cons 50 empty)) 50)
(check-expect (valor-total (cons 20 (cons 10 empty))) 30)

;; =============================================================================
;; 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2

;; Uma Lista-de-preços é 
;; 1. a lista vazia empty, ou
;; 2. (cons n ldvp, onde
;; s : Número e
;; ldv : Lista-de-valores

;; um-real?: lista-de-preços -> boolean
;; verifica se todos os elementos da lista tem preço menor que 1 real
;; Exemplos:
;; (um-real? empty) = true
;; (um-real? (cons 0.99 empty)) = true
;; (um-real? (cons 0.76 (cons 1.2))) = false
(define (um-real? lista)
  (cond
    [(empty? lista) true]
    [else (and (< (first lista) 1)
               (um-real? (rest lista)))]))
;; Testes:
(check-expect (um-real? empty) true)
(check-expect (um-real? (cons 0.99 empty)) true)
(check-expect (um-real? (cons 0.76 (cons 1.2 empty))) false)

;; menor?: lista-de-preços numero -> boolean
;; verifica se todos os elementos da lista de preço sao menores que o numero
;; digitado
;; Exemplos:
;; (menor? empty 1) = true
;; (menor? (cons 0.99 empty) 1) = true
;; (menor? (cons 0.76 (cons 1.2 empty)) 2) = true
(define (menor? lista valor)
  (cond
    [(empty? lista) true]
    [else (and (< (first lista) valor)
               (menor? (rest lista) valor))]))
;; Testes:
(check-expect (menor? empty 1) true)
(check-expect (menor? (cons 0.99 empty) 1) true)
(check-expect (menor? (cons 0.76 (cons 1.2 empty)) 2) true)

;; =============================================================================
;; 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3

;; Uma Lista-de-dígitos é 
;; 1. a lista vazia empty, ou
;; 2. (cons d ldd, onde
;; d : Dígito (número entre 0 e 9) e
;; ldd : Lista-de-dígitos

;; converte: Lista-de-dígitos -> número
;; dada uma lista de dígitos, converte os dígitos em um número, o primeiro dígito
;; da lista é o menos significativo e assim por diante
;; Exemplos:
;; (converte empty) = 0
;; (converte (cons 9 empty)) = 9
;; (converte (cons 9 (cons 4 empty))) = 49
(define (converte lista)
  (cond
    [(empty? lista) 0]
    [else (+ (first lista)
             (* (converte (rest lista)) 10))]))
;; Testes:
(check-expect (converte empty) 0)
(check-expect (converte (cons 9 empty)) 9)
(check-expect (converte (cons 9 (cons 4 empty))) 49)




