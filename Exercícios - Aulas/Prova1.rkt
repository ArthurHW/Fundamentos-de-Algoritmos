;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Prova1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; ====================================================================================================
;;                                  PROVA 1
;; ====================================================================================================

;; ----------------------    1    ----------------------

;; Um elemento do conjunto NumeroOuString é
;; 1. Um número
;; 2. Uma string

;; é1234?: NumeroOuString -> String
;; Dado um número ou uma string, devolve válido se for um número e esse número
;; for 1, 2, 3 ou 4 e inválido caso contrario
;; Exemplos:
;; (é1234? 4) = "Válido"
;; (é1234? "4") = "Inválido"
(define (é1234? numstring)
  (cond
    [(number? numstring) (cond
                           [(or (= numstring 4)
                                (= numstring 3)
                                (= numstring 2)
                                (= numstring 1)) "Válido"]
                           [else "Inválido"])]
    [else "Inválido"]))
;; Testes
(check-expect (é1234? 4) "Válido")
(check-expect (é1234? "4") "Inválido")
(check-expect (é1234? 5) "Inválido")


;; ----------------------    2    ----------------------

;; a)

;; Um voto é
;; 1. Um dos números 1, 2, 3 ou 4
;; 2. A string "Branco"
;; 3. Ou uma string qualquer

;; Uma ListaDeVotos é
;; 1. A lista vazia(empty); ou
;; 2. (cons v ldv), onde:
;; v: Voto
;; ldv: ListaDeVotos


;; b)


;; quantVotos: ListaDeVotos Número -> NumeroOuString
;; Dada uma lista de votos e o número de um candidato, devolve o numero de votos
;; do candidato dado, se o número não for o numero válido de um candidato, devolve
;; a string "Candidato não existente!"
;; Exemplos:
;; (quantVotos (list 1 1 1) 1) = 3
;; (quantVotos (lis 1 2 3 4) 5) = "Candidato não existente!"
(define (quantVotos lista num)
  (cond
    [(empty? lista) 0]
    [(not (or (= num 1) (= num 2) (= num 3) (= num 4))) "Candidato não existente"]
    [(number? (first lista)) (cond
                              [(= (first lista) num) (+ 1 (quantVotos (rest lista) num))]
                              [else (quantVotos (rest lista) num)]
                              )]
    [else (quantVotos (rest lista) num)]))                            
;; Testes:
(check-expect (quantVotos (list 1 1 1) 1) 3)
(check-expect (quantVotos (list 1 2 3 4) 5) "Candidato não existente")
(check-expect (quantVotos (list 1 2 "Branco" "tanto faz" 3 2 1) 2) 2)

;; c)

(define-struct registro (numero votos))
;; Um elemenento do tipo Registro tem o formato
;;     (make-candidato n v), onde:
;; n: Número, representa o número do candiato
;; v: Número, representa a quantidade de votos que o candidato obteve


;; d)

(define Ex1 (list 1 2 "Branco" "qualquer coisa" 3 4 2 4 3 1))
(define Ex2 (list 4 3 2 1 2 4 2 1 2 "Branco" "Branco" "Não faz diferença" "Tudo igual"))


;; e)

;; somaUm: Registro -> Registro
;; dado um registro de um candidato, se o numero do candidato no registro for
;; valido, soma um à sua quantidade de votos, se não o registro permance inalterado
;; Exemplos:
;; (somaUm (make-registro 5 3) = (make-registro 5 3)
;; (somaUm (make-registro 2 2) = (make-registro 2 3)
(define (somaUm registro)
  (local ((define num (registro-numero registro)))
    (cond
      [(or (= num 1) (= num 2) (= num 3) (= num 4)) (make-registro num (+ 1(registro-votos registro)))]
      [else registro])))
;; Testes:
(check-expect (somaUm (make-registro 5 3)) (make-registro 5 3))
(check-expect (somaUm (make-registro 2 2)) (make-registro 2 3))
(check-expect (somaUm (make-registro 2 16)) (make-registro 2 17))


;; f)

;; Um elemento do conjunto ListaDeRegistros é
;; 1. A lista vazia (empty); ou
;; 2. (cons r ldr), onde
;; r: Registro
;; ldr: ListaDeRegistro

;; numStrings: ListaDeVotos -> Número
;; dado uma lista de votos, devolve quantas strings há nesta lista
;; Exemplos:
;; (numStrings (list "uma")) = 1
;; (numStrings (list "duas" "duasMesmo")) = 2
(define (numStrings lista)
  (cond
    [(empty? lista) 0]
    [(string? (first lista)) (+ 1 (numStrings (rest lista)))]
    [else (numStrings (rest lista))]))
;; Testes:
(check-expect (numStrings (list "uma")) 1)
(check-expect (numStrings (list "duas" "duasMesmo")) 2)


;; Resultado: ListaDeVotos ->  ListaDeRegistros
;; dada uma lista de votos, devolve uma lista de registro representando o resultado
;; da votação. A lista devolvida possui 5 registros, sendo um para cada candidato
;; e um para os votos brancos ou nulos, que possuem numero 0 no registro
;; Exemplos:
(define (Resultado lista)
  (list
   (make-registro 0 (numStrings lista))
   (make-registro 1 (quantVotos lista 1))
   (make-registro 2 (quantVotos lista 2))
   (make-registro 3 (quantVotos lista 3))
   (make-registro 4 (quantVotos lista 4))))
;; Testes:
(check-expect (Resultado (list 1 2 3 4 2 3 2 1 2 3 2 3 "num" "qualquer coisa" "Branco")) (list
                                                                                          (make-registro 0 3)
                                                                                          (make-registro 1 2)
                                                                                          (make-registro 2 5)
                                                                                          (make-registro 3 4)
                                                                                          (make-registro 4 1)))


;; ----------------------    3    ----------------------

;; a)

; Exemplos de elementos do conjunto Posn:

(define POSN1 (make-posn 2 3))
(define POSN2 (make-posn 2 4))
(define POSN3 (make-posn 4 3))

;; Exemplos de elementos do conjunto ListaPosn:

(define LISTA1 (cons POSN1 (cons POSN2 empty)))
(define LISTA2 (cons POSN1 (cons POSN3 (cons POSN1 empty))))
(define LISTA3 (cons POSN1 (cons POSN2 (cons POSN1 (cons POSN1 empty)))))

;; funcaoX : Posn Posn -> Booleano
;; Obj: Dados dois Posns, verifica se eles representam o mesmo ponto, ou seja se as coordenadas x e y dos dois
;; são iguais

;; Exemplos:
;; (funcaoX POSN1 POSN2) = false
;; (funcaoX POSN1 POSN1) = true
;; (funcaoX POSN3 POSN1) = false

(define (funcaoX a b)
  (and (= (posn-x a) (posn-x b)) (= (posn-y a) (posn-y b)))
  )

;; funcaoY : Posn ListaPosn -> ListaPosn
;; Obj: Dado um Posn e uma lista de Posn, devolve uma lista, igual a lista dada, porém com
;; os elementos iguais ao Posn dado removidos

;; Exemplos:
;; (funcaoY POSN1 empty) = empty
;; (funcaoY POSN3 LISTA2) = LISTA3
;; (funcaoY POSN1 LISTA3) = (cons POSN2 empty)

(define (funcaoY a b)
  (cond
    [(empty? b) empty]
    [(funcaoX a (first b)) (funcaoY a (rest b))]
    [else (cons (first b)(funcaoY a (rest b)))]
    )
  )


;; funcaoZ : ListaPosn ListaPosn -> ListaPosn
;; Obj: Dados duas ListaPosn subtrai a segunda lista de primeira, ou seja devolve uma lista
;; com todos os elementos que pertencem a primeira lista, mas não pertencem a segunda
;; Exemplos:
;; (funcaoZ LISTA1 empty) = LISTA1
;; (funcaoZ empty LISTA1) = empty
;; (funcaoZ LISTA3 (cons POSN1 empty)) = (cons POSN2 empty)
;; (funcaoZ LISTA3 LISTA2) = (cons POSN2 empty)
(define (funcaoZ x y)
  (cond
    [(empty? y) x]
    [else (funcaoZ (funcaoY (first y) x) (rest y))]
    )
  )

;; b) a b não vou fazer não, perda de tempo



