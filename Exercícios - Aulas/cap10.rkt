;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cap10) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; ==============================================================================
;; 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

(define-struct carta (naipe numero))
;; uma carta é uma estrutura da forma:
;;      (make-carta na nu)
;; onde:
;; na: String: representa o naipe da carta
;; nu: Número: representa o numero/valor da carta

;; Exemplos de cartas:
(define carta1 (make-carta "Copas" 5))
(define carta2 (make-carta "Ouros" 9))
(define carta3 (make-carta "Paus" 13))
(define carta4 (make-carta "Espadas" 5))
(define carta5 (make-carta "Copas" 0))


;; Uma pilhaDeCartas é: 
;; 1. a lista vazia (empty); ou
;; 2. (cons c p) onde:
;; c: carta
;; p: pilhaDeCartas
(define pilha1 empty)
(define pilha2 (cons carta1 empty))
(define pilha3 (cons carta1 (cons carta2 empty)))
(define pilha4 (cons carta1
                     (cons carta2
                           (cons carta3
                                 (cons carta4
                                       (cons carta5 empty))))))

;; filtraCopas: pilhaDeCartas -> pilhaDeCartas
;; dada uma pilha de cartas, devolve uma pilha de cartas, com somente
;; as cartas de Copas, que pertenciam a pilha anterior
;; Exemplos:
;; (filtraCopas pilha1) = empty
;; (filtraCopas pilha2) = pilha2
;; (filtraCopas pilha4) = (cons carta1 (cons carta5 empty))
(define (filtraCopas pilha)
  (cond
    [(empty? pilha) empty]
    [else (cond
            [(string=? "Copas" (carta-naipe (first pilha)))
             (cons (first pilha) (filtraCopas (rest pilha)))]
            [else (filtraCopas (rest pilha))])]))
;; Testes:
(check-expect (filtraCopas pilha1) empty)
(check-expect (filtraCopas pilha2) pilha2)
(check-expect (filtraCopas pilha4) (cons carta1 (cons carta5 empty)))

;; ==============================================================================
;; 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2

;; filtra: String pilhaDeCartas -> pilhaDeCarta
;; dada uma string representando um naipe ("Copas", "Ouros", "Espadas" ou "Paus")
;; e uma pilhaDeCartas, devolve uma pilha de cartas, com as cartas do naipe
;; especificado no primeiro argumento que estão na pilha
;; Exemplos:
;; (filtra "Ouros" pilha4) = (cons carta2 empty)
;; (filtra "Paus" pilha4) = (cons carta3 empty)
;; (filtra "Espadas" pilha4)= (cons carta4 empty)
;; (filtra "Copas" pilha4) = (cons carta1 (cons carta5 empty))
(define (filtra naipe pilha)
  (cond
    [(empty? pilha) empty]
    [else (cond
            [(string=? naipe (carta-naipe (first pilha)))
             (cons (first pilha) (filtra naipe (rest pilha)))]
            [else (filtra naipe (rest pilha))])]))
;; Testes:
(check-expect (filtra "Ouros" pilha4) (cons carta2 empty))
(check-expect (filtra "Paus" pilha4) (cons carta3 empty))
(check-expect (filtra "Espadas" pilha4) (cons carta4 empty))
(check-expect (filtra "Copas" pilha4) (cons carta1 (cons carta5 empty)))

;; =============================================================================
;; 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3

;; Uma listaDeNumeros é
;; 1. A lista vazia (empty); ou
;; 2. (cons n l), onde:
;; n: Número
;; l: listaDeNumeros

;; Exemplos de listaDeNumeros
(define lista1 empty)
(define lista2 (cons 5 empty))
(define lista3 (cons 5 (cons 9 empty)))
(define lista4 (cons 5 (cons 9 (cons 13 (cons 5 (cons 0 empty))))))

;; valores-cartas: pilhaDeCartas -> listaDeNumeros
;; dada uma pilhaDeCartas, devolve uma listaDeNumeros, com os valores de cada
;; carta
;; Exemplos
;; (valores-cartas pilha1) = lista1 
;; (valores-cartas pilha2) = lista2
;; (valores-cartas pilha3) = lista4
;; (valores-cartas pilha4) = lista4
(define (valores-cartas pilha)
  (cond
    [(empty? pilha) empty]
    [else (cons (carta-numero (first pilha)) (valores-cartas (rest pilha)))]))
;; Testes:
(check-expect (valores-cartas pilha1) lista1)
(check-expect (valores-cartas pilha2) lista2)
(check-expect (valores-cartas pilha3) lista3)
(check-expect (valores-cartas pilha4) lista4)

;; ==============================================================================
;; 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4

;; somaOuros: pilhasDeCartas -> Número
;; dada uma pilhaDeCartas, devolve a soma das cartas de ouros da pilha
;; Exemplos:
;; (somaOuros pilha1) = 0
;; (somaOuros pilha2) = 0
;; (somaOuros pilha3) = 9
;; (somaOuros pilha4) = 9
(define (somaOuros pilha)
  (cond
    [(empty? pilha) 0]
    [else (cond
            [(string=? "Ouros" (carta-naipe (first pilha)))
             (+ (carta-numero (first pilha)) (somaOuros (rest pilha)))]
            [else (somaOuros (rest pilha))])]))
;; Testes:
(check-expect (somaOuros pilha1) 0)
(check-expect (somaOuros pilha2) 0)
(check-expect (somaOuros pilha3) 9)
(check-expect (somaOuros pilha4) 9)

;; ==============================================================================
;; 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5

;; substituiCartas: pilhaDeCartas -> pilhaDeCartas
;; dada uma pilha de cartas, substitui cada carta, por uma carta do mesmo naipe,
;; porém com o valor acrescido de uma unidade, o rei (13) e o joker permanecem
;; iguais
;; Exemplos:
;; (substituiCartas pilha1) = empty
;; (substituiCartas pilha2) = (cons (make-carta "Copas" 6) empty)
;; (substituiCartas pilha3) = (cons (make-carta "Copas" 6) (cons (make-carta "Ouros 10) empty))
(define (substituiCartas pilha)
  (cond
    [(empty? pilha) empty]
    [(or (= (carta-numero (first pilha)) 0)
         (= (carta-numero (first pilha)) 13))
     (cons (first pilha) (substituiCartas (rest pilha)))]
    [else (cons (make-carta (carta-naipe (first pilha))
                            (+ 1 (carta-numero (first pilha))))
                (substituiCartas (rest pilha)))]))
;; Testes:
(check-expect (substituiCartas pilha1) empty)
(check-expect (substituiCartas pilha2) (cons (make-carta "Copas" 6) empty))
(check-expect (substituiCartas pilha3) (cons (make-carta "Copas" 6) (cons (make-carta "Ouros" 10) empty)))

























  