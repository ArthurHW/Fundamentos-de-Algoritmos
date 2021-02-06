;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Alta_Ordem) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;; 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 

;; calculadora: (Número Número -> Número) Número Número -> Número
;; dados uma operação e dois números, realiza a operação nos dois números
;; e devolve o resultado
;; Exemplos:
;; (calculadora + 2 3) = 5
;; (calculadora - 8 2) = 6
;; (calculadora * 3 4) = 12
;; (calculadora / 9 3) = 3
(define (calculadora f n1 n2)
  (f n1 n2))
;; Testes:
(check-expect (calculadora + 2 3) 5)
(check-expect (calculadora - 8 2) 6)
(check-expect (calculadora * 3 4) 12)
(check-expect (calculadora / 9 3) 3)

;; 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2

;; Uma ListaDeNumeros é
;; 1. a lista vazia (empty); ou
;; 2. (cons n ldn), onde:
;; n: Número
;; ldn: ListaDeNumeros

;; Uma ListaDeString é
;; 1. a lista vazia (empty); ou
;; 2. (cons s lds), onde:
;; n: String
;; ldn: ListaDeString

;; mapeia: (Número -> Número) ListaDeNumeros -> ListaDeNumeros
;; dada uma função unaria sobre numeros e uma lista de numeros, gera uma
;; lista com os resultados da função aplicada a cada elemento da lista
;; original
;; Exemplos:
;; (mapeia sqr (list 2 5 10 3)) = (list 4 25 100 9)
(define (mapeia f lista)
  (cond
    [(empty? lista) empty]
    [else (cons (f (first lista)) (mapeia f (rest lista)))]))
;; Testes:
(check-expect (mapeia sqr (list 2 5 10 3)) (list 4 25 100 9))

;; 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3

;; mapeia-mod: (Número -> String) ListaDeNúmeros -> ListaDeString
;; Dada uma função unária que consome um número e gera uma string e uma lista
;; de números, gera uma lista de string
;; Exemplos:
;; (mapeia-mod cor? (list 1 2 3 4)) = (list "black" "red" "green" "black")
(define (mapeia-mod f lista)
  (cond
    [(empty? lista) empty]
    [else (cons (f (first lista)) (mapeia-mod f (rest lista)))]))
;; Testes:
(check-expect (mapeia-mod cor? (list 1 2 3 4)) (list "black" "red" "green" "black"))

;; cor?: Número -> String
;; dado um número, devolve uma cor correspondente
;; Exemplos:
;; (cor? 1) = "black"
;; (cor? 2) = "red"
;; (cor? 3) = "green"
(define (cor? n)
  (cond
    [(= (remainder n 3) 1) "black"]
    [(= (remainder n 3) 2) "red"]
    [(= (remainder n 3) 0) "green"]))
;; Testes:
(check-expect (cor? 2) "red")

;; 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4

;; filtraNum: (Número -> Booleano) ListaDeNúmeros -> ListaDeNúmeros
;; dada uma função que seleciona número por um criterio e uma lista de numeros
;; gera uma lista de numeros, somente coms os elementos para os quais a
;; função dada retorna true
;; Exemplos:
;; (filtraNum éPar? (list 1 2 3 4 5)) = (list 2 4)
(define (filtraNum f lista)
  (cond
    [(empty? lista) empty]
    [(f (first lista)) (cons (first lista) (filtraNum f (rest lista)))]
    [else (filtraNum f (rest lista))]))
;; Testes:
(check-expect (filtraNum éPar? (list 1 2 3 4 5)) (list 2 4))

;; éPar?: Número -> Booleano
;; dado um numero verifica se ele é par
;; Exemplos:
;; (éPar? 2) = true
;; (épar? 3) = false
(define (éPar? n)
  (= (remainder n 2) 0))
;; Testes:
(check-expect (éPar? 2) true)
(check-expect (éPar? 3) false)

;; 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 

;; Trabalhos, porém simples