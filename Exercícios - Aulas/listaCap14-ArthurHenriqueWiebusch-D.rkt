;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname listaCap14-ArthurHenriqueWiebusch-D) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;; ==========================================================================
;; 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
;; ==========================================================================

;; Um elemento do conjunto Data é um elemento do cjto. NumerosInteiros

;; d1<=d2? : Data Data -> Boolean
;; dadas 2 datas (apenas o ano), verifica se a primeira é menor ou igual a segunda
;; Exemplos:
;: (d1<=d2? 2014 2014) = true
;; (d1<=d2? 2014 2013) = false
(define (d1<=d2? d1 d2)
  (<= d1 d2))
;; Testes:
(check-expect (d1<=d2? 2014 2014) true)
(check-expect (d1<=d2? 2014 2013) false)

;; ==========================================================================
;; 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 
;; ==========================================================================

(define-struct filho (pai mãe nome data olhos))
; Um elemento nó de um conjunto Nó (de uma árvore genealógica) é:
; 1. Empty, representando falta de informação; ou
; 2. (make-filho p m n d o), onde:
; p: Nó, representa o pai da pessoa representada por este nó
; m: Nó, representa a mãe da pessoa representada por este nó
; n: Símbolo, representa o nome da pessoa represetada pelo nó
; d: Número, representa a data de nascimento da pessoa representada pelo nó
; o: Símbolo, represena a cor dos olhos da pessoa representada pelo nó
(define Althea (make-filho empty empty 'Althea 1915 'brown))
(define Jack (make-filho empty empty 'Jack 1948 'brown))
(define Judy (make-filho empty Althea 'Judy 1945 'green))
(define Monica (make-filho Jack Judy 'Monica 1968 'blue))
(define Ross (make-filho Jack Judy 'Ross 1966 'brown))
(define Sandra (make-filho empty empty 'Sandra 1947 'brown))
(define Leonard (make-filho empty empty 'Leonard 1947 'brown))
(define Rachel (make-filho Leonard Sandra 'Rachel 1969 'blue))
(define Nora (make-filho empty empty 'Nora 1948 'blue))
(define Charles (make-filho empty empty 'Charles 1948 'blue))
(define Chandler (make-filho Charles Nora 'Chandler 1966 'blue))
(define GloriaTribbiani (make-filho empty empty 'GloriaTribbiani 1950 'brown))
(define MrTribbiani (make-filho empty empty 'MrTribbiani 1949 'brown))
(define Joey (make-filho MrTribbiani GloriaTribbiani 'Joey 1969 'brown))
(define Frank (make-filho empty empty 'Frank 1940 'brown))
(define LilyBuffay (make-filho empty empty 'LilyBuffay 1940 'blue))
(define Phoebe (make-filho Frank LilyBuffay 'Phoebe 1965 'blue))
(define Carol (make-filho empty empty 'Carol 1965 'blue))
(define Ben (make-filho Ross Carol 'Ben 1994 'blue))
(define Emma (make-filho Ross Rachel 'Emma 2002 'blue))

;; ==========================================================================
;; 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
;; ==========================================================================

;; maisIdoso: Nó -> Nó
;; retorna o ancestral mais idoso de um nó dado
;; Exemplos:
;; (maisIdoso Ben) = Althea
;; (maisIdoso empty) = empty
;; (maisIdoso Rachel) = Leonard
;; (maisIdoso Althea) = Althea
(define (maisIdoso n)
  (cond
    ;; se o nó for empty, retornar empty
    [(empty? n) empty]
    ;; se o nó não possui ancestrais, retornar o próprio nó
    [(and (empty? (filho-pai n)) (empty? (filho-mãe n)))
     n]
    ;; se o nó não possui um pai conhecido, calcular o mais idoso entre os
    ;; ancestrais da mãe
    [(empty? (filho-pai n))
     (maisIdoso (filho-mãe n))]
    ;; se o nó não possui uma mãe conhecida, calcular o mais idoso entre os
    ;; ancestrais do pai
    [(empty? (filho-mãe n))
     (maisIdoso (filho-pai n))]
    ;; senão 
    [else
     (cond
       ;; se o ancestral por parte de pai for o mais idoso, retorná-lo
       [(d1<=d2? (filho-data (maisIdoso (filho-pai n)))
               (filho-data (maisIdoso (filho-mãe n))))
        (maisIdoso (filho-pai n))]
     ;; senão retornar o ancestral mais idoso por parte de mãe
       [else (maisIdoso (filho-mãe n))])]))
;; Testes:
(check-expect (maisIdoso Ben) Althea)
(check-expect (maisIdoso empty) empty)
(check-expect (maisIdoso Rachel) Leonard)
(check-expect (maisIdoso Althea) Althea)
(check-expect (maisIdoso Judy) Althea)

;; =========================================================================
;; 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
;; =========================================================================

(define-struct nó (id conteúdo esq dir))
;; Um elemento do conjunto AB (Árvore Binária) pode ser
;; 1. empty , representando a falta de informação, ou
;; 2. (make-nó id c e d)
;; onde:
;;   id : Número, representa o identificador do nó
;;   c : String, representa o conteúdo do nó
;;   e : AB, representa a sub-árvore da esquerda
;;   d : AB, representa a sub-árvore da direita

;; constantes:
(define NÓ1 (make-nó 10 "A"
                     (make-nó 7 "B"
                              empty
                              (make-nó 9 "C"
                                       empty
                                       empty))
                     (make-nó 14 "D"
                              (make-nó 12 "E"
                                       empty
                                       empty)
                              empty)))
(define NÓ2 (make-nó 12 "A"
                     (make-nó 18 "B"
                              empty
                              empty)
                     empty))
(define NÓ3 (make-nó 10 "A"
                     empty
                     (make-nó 15 "B"
                              (make-nó 9 "C"
                                       empty
                                       empty)
                              (make-nó 17 "D"
                                       empty
                                       empty))))

;(define-struct nó (id conteúdo esq dir))
;; Um elemento do conjunto ABP (Árvore Binária de Pesquisa) pode ser
;; 1. empty , representando a falta de informação, ou
;; 2. (make-nó id c e d)
;; onde:
;; id : Número, representa o identificador do nó
;; c : String, representa o conteúdo do nó
;; e : ABP, representa a sub-árvore da esquerda e
;; contém apenas nós com identificadores menores que id
;; d : ABP, representa a sub-árvore da direita
;; contém apenas nós com identificadores maiores que id

;; Uma ListaDeNúmeros é
;; 1. a lista vazia (empty); ou
;; 2. (cons n ldn), onde:
;; n: Número
;; ldn: ListaDeNúmeros

;; ordena: AB -> ListaDeNúmeros
;; dada uma AB, ordena seus ids, começando do nó mais a esquerda e indo até
;; o nó mais a direita
;; Exemplos:
;; (ordena NÓ1) = (ordena NÓ1) (cons 7
;;                                 (cons 9
;;                                       (cons 10
;;                                             (cons 12
;;                                                   (cons 14 empty)))))
;; (ordena empty) = empty
;; (ordena NÓ2) = (ordena NÓ2) (cons 18
;;                                 (cons 12 empty))
(define (ordena ab)
  (cond
    [(empty? ab) empty]
    [(nó? ab)
     (append
      (ordena (nó-esq ab))
      (cons (nó-id ab)
            (ordena (nó-dir ab))))]))
;; Testes:
(check-expect (ordena empty) empty)
(check-expect (ordena NÓ1) (cons 7
                                 (cons 9
                                       (cons 10
                                             (cons 12
                                                   (cons 14 empty))))))
(check-expect (ordena NÓ2) (cons 18
                                 (cons 12 empty)))
(check-expect (ordena NÓ3) (cons 10
                   (cons 9
                         (cons 15
                               (cons 17 empty)))))

;; listaCrescente?: ListaDeNúmeros -> Booleano
;; dada uma lista de números, verifica se ela está em ordem crescente
;; Exemplos:
;; (listaCrescente? empty) = true
;; (listaCrescente? (ordena NÓ1) = true
;; (listaCrescente? (ordena NÓ2) = false
;; (listaCrescente? (ordena NÓ3) = false
(define (listaCrescente? lista)
  (cond
    [(empty? lista) true]
    [(empty? (rest lista)) true]
    [else (and (d1<=d2? (first lista) (first (rest lista)))
               (listaCrescente? (rest lista)))]))
;; Testes:
(check-expect (listaCrescente? empty) true)
(check-expect (listaCrescente? (ordena NÓ1)) true)
(check-expect (listaCrescente? (ordena NÓ2)) false)
(check-expect (listaCrescente? (ordena NÓ3)) false)
    
;; é-abp?: AB -> Booleano
;; dada uma árvore binária, retorna um valor booleano, representando se ela
;; é uma árvore binária de pesquisa.
;; Exemplos:
;; (é-abp? empty) = true
;; (é-abp? NÓ1) = true
;; (é-abp? NÓ2) = false
;; (é-abp? NÓ3) = false
(define (é-abp? ab)
  (listaCrescente? (ordena ab)))
;; Testes:
(check-expect (é-abp? empty) true)
(check-expect (é-abp? NÓ1) true)
(check-expect (é-abp? NÓ2) false)
(check-expect (é-abp? NÓ3) false)
     








