;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Prova2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct artigo (titulo autores texto))

;; Um artigo do conjunto Artigo é uma estrutura
;; (make-artigo t aut txt)
;; onde t : Simbolo, é o título do artigo;
;; aut : Lista-de-simbolos , é a lista de autores do artigo; e
;; txt : Texto-cientifico, é o texto do artigo.

;; Uma Lista-de-simbolos é
;; 1) empty ou
;; 2) (cons s ls), onde s é Simbolo e ls é Lista-de-símbolos

;; Um Texto-cientifico é
;; 1) empty, ou
;; 2) (cons s tc), onde s é um Símbolo e tc é do tipo Texto-científico;
;; 3) (cons a tc), onde a é um Artigo, e tc é do tipo Texto-cientifico.


;; a)


(define A1 (make-artigo 'EraDigital (list 'eu) (list 'alguns 'simbolo 'aleatorios 'e 'uns 'iguais 'iguais 'iguais)))
(define A2 (make-artigo 'VicioEmJogos (list 'eu 'e 'mais 'um) (list 'iguais 'iguais A1)))

(define TC1 (list A2 'Is 'A 'Disease 'iguais))
(define TC2 (list A1 'Problema 'da 'modernidade))


;; b)


;; ocorrencias: Artigo Simbolo -> Numero
;; Dado um artigo e um síbolo, retorna o numero de ocorrencias deste simbolo no artigo e nos
;; subartigos
;; Exemplos:
(define (ocorrencias artigo simbolo)
  ;; somente verifica se há algum simbolo no texto do artigo, já que a questão não especifica  se o simbolo pode estar em qualquer lugar
  ;; assumi que o mais provavel seria verificar somente o texto cientifico
  (ocorrencias-texto (artigo-texto artigo) simbolo))
;; Testes:
(check-expect (ocorrencias A1 'iguais) 3)
(check-expect (ocorrencias A2 'iguais) 5)

;; ocorrencias-texto: Texto-científico Simbolo -> Numero
;; devolve quantas vezes um determiando simbolo aparece em um texto científico
;; Exemplos:
(define (ocorrencias-texto lista simbolo)
  (cond
    ;; se a lista for vazia, retorna zero
    [(empty? lista) 0]
    ;; se o primeiro elemento da lista for um artigo, verifica quatas ocorrencias do simbolo dado há nesse artigo e soma com quantas
    ;; ocorrencias desse simbolo há no resto da lista
    [(artigo? (first lista)) (+ (ocorrencias (first lista) simbolo) (ocorrencias-texto (rest lista) simbolo))]
    ;; se o primeiro elemento da lista for um sibolo
    [(symbol? (first lista)) (cond
                               ;; soma um se ele for igual ao simbolo procurado
                               [(symbol=? (first lista) simbolo) (+ 1 (ocorrencias-texto (rest lista) simbolo))]
                               ;; ou somente verifica o resto da lista, caso ele não seja o simbolo procurado
                               [else (ocorrencias-texto (rest lista) simbolo)])]))
;; Testes:
(check-expect (ocorrencias-texto TC1 'iguais) 6)
(check-expect (ocorrencias-texto TC2 'iguais) 3)


;; c)


;; sub-par: Numero Numero -> Booleano
;; dados dois numeros, verifica se a subtracao do primeiro pelo segundo resulta em um numero par
;; Exemplos:
(define (sub-par num1 num2)
  (= 0 (remainder (- num1 num2) 2)))
;; Testes:
(check-expect (sub-par 5 3) true)
(check-expect (sub-par 2 1) false)


;; compara: Artigo Simbolo Numero (Numero Numero -> Booleano) -> Booleano
;; Dados um artigo, um simbolo, um numero e uma funcao que compara dois numeros, compara o numero dado
;; com o numero de ocorrencias do simbolo dado no artigo dado
;; Exemplos:
(define (compara artigo simbolo num funcao)
  (funcao num (ocorrencias artigo simbolo)))
;; Testes:
(check-expect (compara A1 'iguais 5 >) true)
(check-expect (compara A1 'iguais 2 <) true)
(check-expect (compara A2 'iguais 3 sub-par) true)


;; d)

;; Uma ListaDeSimboloOuFalse é
;; 1. Uma ListaDeSimbolos
;; 2. False

;; autores?: Simbolo Artigo -> ListaDeSimbolosOuFalse
;; dado um simbolo e um artigo nesta ordem, retorna os autores do artigo, se o simbolo ocorre neste artigo
;; se nao retorna false
;; Exemplos:
(define (autores? simbolo artigo)
  (local ((define ocorre (autores-texto simbolo (artigo-texto artigo))))
  (cond
    [(empty? ocorre) false]
    [(list? ocorre) (append (artigo-autores artigo) ocorre)])))
;; Testes:

;; autores-texto: Simbolo Texto-cientifico -> ListaDeSimbolosOuFalse
;; dado um simbolo e um texto cientifico, devolve os autores que citaram o simbolo dado
;; Exemplos:
(define (autores-texto simbolo texto)
  (cond
    [(empty? texto) empty]
    [(artigo? (first texto)) (append (autores? simbolo (first texto)) (autores-texto simbolo (rest texto)))]
    [(symbol? (first texto)) (cond
                               [(symbol=? (first texto) simbolo) (append (list empty) (autores-texto simbolo (rest texto)))]
                               [else (autores-texto simbolo (rest texto))])]))
;; Testes:
(autores? 'batata A2)



;; -------------------------------        2      ----------------------------------


;; a)


;; testa-soma: Número Número Número --> .......................
;; exemplos:
;; (testa-soma 1 3 100) = .......................................................
;; (testa-soma 5 1 100) =........................................................
;; (testa-soma 2 4 7) = .........................................................
;; (testa-soma 2 4 20) = ........................................................
(define (testa-soma x y z)
  (local (
          ;; soma: Número Número --> Booleano
          ;; exemplos:
          ;; ........................................................................
          ;; ........................................................................
          (define (soma i nivel)
            (cond
              [(or (> x y) (< x 1) (< y 1)) ’ArgumentosInvalidos]
              [(= i y) i]
              [(= nivel 1) (+ (soma i 2) (soma (+ i 1) 1))]
              [else (+ i (soma (+ i 1) 2))]
              )
            )
          (define SOMA (soma x 1))
          )
    (cond
      [(symbol? SOMA) SOMA]
      [(> SOMA z) ’Maior]
      [(< SOMA z) ’Menor]
      [(= SOMA z) SOMA]
      )
    )
  )





    
    

