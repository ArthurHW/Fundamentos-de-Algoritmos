;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Cap14) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;                       ARVORE GENEALÓGICA

(define-struct pessoa (nome ano olhos pai mãe))
;; Um elemento do conjunto Pessoa pode ser
;; 1. empty , representando a falta de informação, ou
;; 2. (make-pessoa n a o p m)
;; onde:
;; n : String, representa o nome da pessoa
;; a : Número, representa o ano de nascimento da pessoa
;; o : String, representa a cor dos olhos da pessoa
;; p : Pessoa, representa o pai da pessoa
;; m : Pessoa, representa a mãe da pessoa

;;                       ANCESTRAL DE OLHOS AZUIS

;; ancestralOlhosAzuis: Pessoa -> Boooleano
;; Dada uma pessoa, verificar se ela ou algum de seus ancestrais tem
;; olhos azuis.
;; Exemplo:
;; (ancestral-olhos-azuis? GUSTAVO) = true
;; (ancestral-olhos-azuis? FRED) = false
(define (ancestralOlhosAzuis? p)
  (cond
    ;; se pr é empty, devolver false.
    [(empty? p) false]
    ;; se p tem olhos azuis, devolver true.
    [(string=? (pessoa-olhos p) "azuis") true]
    ;; Senão, existe ancestral de olhos azuis se
    [else
     ;; OU
     (or
      ;; existe alguém alguém de olhos azuis entre
      (ancestralOlhosAzuis?
       ;; os ancestrais por parte de mãe, OU
       (pessoa-mãe p))
      ;; existe alguém de olhos azuis entre
      (ancestralOlhosAzuis?
       ;; os ancestrais por parte de pai
       (pessoa-pai p)))]))

;;                         QUANTOS ANCESTRAIS?


;; quantosAncestrais?: Pessoa -> Número
;; dada uma  pessoa devolve o número de ancestrais conhecidos, dela
;; contando com ela mesma
;; Exemplos:
;; (quantosAncestrais? Gustavo) = 3
;; (quantosAncestrais? Fred) = 1
(define (quantosAncestrais? p)
  (cond
    [(empty? p) 0]
    [else (+ 1 (quantosAncestrais? (pessoa-pai p))
             (quantosAncestrais? (pessoa-mãe p)))]))

;; quantosAncestrais?.v2: Pessoa -> Número
;; dada uma  pessoa devolve o número de ancestrais conhecidos, dela
;; contando com ela mesma
;; Exemplos:
;; (quantosAncestrais?.v2 Gustavo) = 2
;; (quantosAncestrais?.v2 Fred) = 0
(define (quantosAncestrais?.v2 p)
  (cond
    [(= (quantosAncestrais? p) 0) 0]
    [else
     (- (quantosAncestrais? p) 1)]))

;;                             ÁRVORE BINÁRIA

(define-struct nó (id conteúdo esq dir))
;; Um elemento do conjunto AB (Árvore Binária) pode ser
;; 1. empty , representando a falta de informação, ou
;; 2. (make-nó id c e d)
;; onde:
;; id : Número, representa o identificador do nó
;; c : String, representa o conteúdo do nó
;; e : AB, representa a sub-árvore da esquerda
;; d : AB, representa a sub-árvore da direita


;; Uma ListaDeNúmeros é
;; 1. A lista vazia(empty); ou
;; 2. (cons n ldn), onde:
;; n: Número
;; ldn: ListaDeNúmeros

(define AB1 (make-nó 10 "A"
                     (make-nó 12 "B" empty empty)
                     (make-nó 3 "C"
                              (make-nó 15 "D"
                                       (make-nó 1 "F" empty empty)
                                       empty)
                              (make-nó 20 "E" empty empty))))

;; IDs: AB -> ListaDeNúmeros
;; dada uma árvore binária, retorna uma lista com os iids dos nós da
;; árvore
;; (IDs AB1) = (cons 10
;;      (cons 12
  ;;          (cons 3
    ;;              (cons 15
      ;;                  (cons 1
        ;;                      (cons 20
          ;;                          (empty)))))))
(define (IDs ab)
  (cond
    [(empty? ab) empty]
    [else
     (append (cons (nó-id ab) (IDs (nó-esq ab)))
             (IDs (nó-dir ab)))]))


;;                          ÁRVORE BINÁRIA DE PESQUISA


(define-struct par (id cont))
;; Um elemento do conjunto Par tem o formato
;; (make-par id c), onde:
;; id : Número, representa o id
;; c : String, representa um conteúdo

;; Uma ListaPar é
;; 1. empty, ou
;; 2. (cons p lp), onde p: Par e lp: ListaPar


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

(define L1 (list (make-par 11 "F") (make-par 20 "E") (make-par 3 "B")
 (make-par 15 "D") (make-par 17 "B") (make-par 10 "A")))

;; constróiABP: ListaPar -> ABP
;; Dada uma lista de pares de identificador e conteúdo, gera uma ABP com estes pares..
;; Exemplo:
;; (constróiABP empty) = empty
;; (constrói ABP L1) = (make-nó 10 "A"
;; (make-nó 3 “B” empty empty)
;; (make-nó 17“C”
;; (make-nó 15 “D”
;; (make-nó 11 “F" empty empty)
;; empty)
;; (make-nó 20 “E” empty empty)))
(define (constróiABP lp)
  (cond
    [(empty? lp) empty]
    [else
     (insere-nó ;; inserir um nó com
      (par-id (first lp)) ;; o identificador do primeiro nó da lista
      (par-cont (first lp)) ;; o conteúdo do primeiro nó da lista
      (constróiABP(rest lp)))])) ;; na árvore com o resto dos pares da lista

;; insere-nó: Número String ABP -> ABP
;; Dados um identificador, um conteúdo e uma ABP, insere um nó com
;; este identificador e conteúdo na ABP.
;; Exemplo:
;; (insere-nó 20 "E" empty) = (make-nó 20 "E" empty empty)
;; outros exemplos...
(define (insere-nó id cont abp)
  (cond
    [(empty? abp) (make-nó id cont empty empty)]
    [(> id (nó-id abp))
        (make-nó ;; ABP construída inserindo o nó com id, cont na subárvore da direita de abp
         (nó-id abp) ;; id da raiz da ABP
         (nó-conteúdo abp) ;; conteúdo da raiz da ABP
         (nó-esq abp) ;; subárvore da esquerda da ABP
         (insere-nó id cont (nó-dir abp)))] ;; nova subárvore da direita da ABP
    [(< id (nó-id abp))
        (make-nó ;; ABP construída inserindo o nó com id, cont na subárvore da esquerda de abp
         (nó-id abp) ;; id da raiz da ABP
         (nó-conteúdo abp) ;; conteúdo da raiz da ABP
         (insere-nó id cont (nó-esq abp)) ;; nova subárvore da esquerda da ABP
         (nó-dir abp))])) ;; subárvore da direita da ABP

;;                         ENCONTRA NÓ

;; Uma ABPouString é
;; 1. Uma ABP; ou
;; 2. Uma string

;; encontra-nó Número ABP -> ABPouString
;; Dados um identificador e uam Abp, retorna o conteúdo relacionado a este
;; identificador, se não houver nó com este identificador, retorna a mensagem
;; "Nó não encontrado".
(define (encontra-nó id abp)
  (cond
    [(empty? abp) "Nó não encontrado"]
    [(= id (nó-id abp)) abp]
    [(> id (nó-id abp)) (encontra-nó id (nó-dir abp))]
    [(< id (nó-id abp)) (encontra-nó id (nó-esq abp))]
        ))
(encontra-nó 3 (constróiABP L1))



