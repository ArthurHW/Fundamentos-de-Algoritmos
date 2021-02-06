;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname AulaCap28_Grafos) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;; Um elemento do conjunto ListaDeString é
;; 1. a lista vazia (empty); ou
;; 2. (cons s lds), onde
;; s: String
;; lds: ListaDeString

(define-struct nodo (nome vizinhos))
;; Um nodo é um par
;; (make-nodo n v), onde
;; n : String, representa o nome do nodo
;; v : ListaDeString, representa os nodos vizinhos

;; Um Grafo é
;; 1. empty, ou
;; 2. (cons n g), onde
;; n : Nodo
;; g : Grafo

(define GrafoABCD (list
                   (make-nodo "A" (list "B" "C"))
                   (make-nodo "B" (list "A" "C"))
                   (make-nodo "C" (list "B" "D"))
                   (make-nodo "D" (list "C"))
                   ))

(define GrafoG (list
                (make-nodo "Duluth" (list "Toronto"))
                (make-nodo "Toronto" (list "Duluth" "Chicago" "Pittsburgh"))
                (make-nodo "Chicago" (list "Toronto"))
                (make-nodo "Pittsburgh" (list "Toronto"))
                ))

(define MAPA (list
              (make-nodo "Winnipeg" (list "Sault Ste. Marie" "Duluth" "Helena"))
              (make-nodo "Helena" (list "Duluth" "Winnipeg" "Omaha" "Denver"))
              (make-nodo "Denver" (list "Helena" "Omaha" "Kansas City" "Santa Fé" "Oklahoma City"))
              (make-nodo "Santa Fé" (list "Denver" "Oklahoma City"))
              (make-nodo "Oklahoma City" (list "Santa Fé" "Denver" "Kansas City" "Little Rock"))
              (make-nodo "Kansas City" (list "Omaha" "Denver" "Oklahoma City" "Saint Louis"))
              (make-nodo "Omaha" (list "Duluth" "Helena" "Denver" "Kansas City" "Chicago"))
              (make-nodo "Duluth" (list "Winnipeg" "Helena" "Omaha" "Sault Ste. Marie" "Toronto" "Chicago"))
              (make-nodo "Sault Ste. Marie" (list "Winnipeg" "Duluth" "Toronto"))
              (make-nodo "Toronto" (list "Sault Ste. Marie" "Duluth" "Pittsburgh"))
              (make-nodo "Chicago" (list "Duluth" "Toronto" "Pittsburgh" "Saint Louis" "Omaha"))
              (make-nodo "Saint Louis" (list "Kansas City" "Chicago" "Pittsburgh" "Nashville" "Little Rock"))
              (make-nodo "Little Rock" (list "Oklahoma City" "Saint Louis" "Nashville"))
              (make-nodo "Nashville" (list "Saint Louis" "Little Rock" "Atlanta" "Pittsburgh"))
              (make-nodo "Atlanta" (list "Nashville"))
              (make-nodo "Pittsburgh" (list "Toronto" "Chicago" "Saint Louis" "Nashville"))))

;; vizinhos: String Grafo -> ListaDeString
;; Dados o nome de um nodo e um grafo, devolve os nomes de
;; todos os nodos vizinhos do nodo dado.
;; Obs.: O nodo dado deve fazer parte do grafo
;; Exemplos:
;; (vizinhos "Chicago" GrafoG) = (list "Toronto")
;; (vizinhos "A" GrafoABCD) = (list "B" "C")
(define (vizinhos nome grafo)
 (cond
   ;; Se o grafo grafo estiver vazio, retornar a lista vazia.
   [(empty? grafo) empty]
   ;; Se o nome do primeiro nodo do grafo for nome, devolve os vizinhos deste nodo
   [(string=? nome (nodo-nome (first grafo))) (nodo-vizinhos (first grafo))]
   ;; senão, procura os vizinhos do nome nos outros nodos do grafo.
   [else (vizinhos nome (rest grafo ))]))
;; Testes:
(check-expect (vizinhos "Chicago" GrafoG) (list "Toronto"))
(check-expect (vizinhos "Toronto" GrafoG) (list "Duluth" "Chicago" "Pittsburgh"))
(check-expect (vizinhos "A" GrafoABCD) (list "B" "C"))

(define LISTAABC (list "A" "B" "C"))
(define LISTABCD (list "B" "C" "D"))

;; está-na-lista?: String ListaDeString -> Booleano
;; dados um nome (string) e uma lista de strings,
;; diz se o nome dado está na lista.
;; Exemplos:
;; (está-na-lista? "A" (list "A" "B" "C")) = true
;; (está-na-lista? "Chicago" (list "Toronto" "Chicago" "Denver")) = true
(define (está-na-lista? nome lista)
  (cond
    ;; se a lista for vazia, retorna falso
    [(empty? lista) false]
    ;; se o primeiro elemento da lista for o nome buscado, retorna true
    [(string=? nome (first lista)) true]
    ;; senão testa o resto da lista
    [else (está-na-lista? nome (rest lista))]))
;; Testes:
(check-expect (está-na-lista? "A" LISTAABC) true)
(check-expect (está-na-lista? "A" LISTABCD) false)
(check-expect (está-na-lista? "Chicago" (list "Toronto" "Chicago" "Denver")) true)

;; subtrai-lista: ListaDeString ListaDeString -> ListaDeString
;; dadas duas lista de strings, devolve todos os
;; elementos da primeira lista que não estão na segunda (ou seja,
;; subtrai a segunda lista da primeira).
;; Exemplos:
;; (subtrai-lista LISTAABC LISTABCD) = (list "A")
;; (subtrai-lista LISTABCD LISTAABC) = (list "D")
(define (subtrai-lista lista1 lista2)
  (cond
    ;; se a lista 1 estiver vazia, devolve uma lista vazia
    [(empty? lista1) empty]
    ;; se a lista 2 estiver vazia, devolve a lista 1
    [(empty? lista2) lista1]
    ;; se o primeiro elemento da lista 1 está na lista 2, não coloca ele na lista 
    ;; retornada para a função e so calcula para o resto da lista
    [(está-na-lista? (first lista1) lista2) (subtrai-lista (rest lista1) lista2)]
    ;; senao, coloca o primeiro elemento da lista 1 na lista ja subtraida da lista 2
    [else (cons (first lista1) (subtrai-lista (rest lista1) lista2))]))
;; Testes:
(check-expect (subtrai-lista LISTAABC LISTABCD) (list "A"))
(check-expect (subtrai-lista LISTABCD LISTAABC) (list "D"))
(check-expect (subtrai-lista (list "oi") (list "Oi")) (list "oi"))

;; Um elemento do tipo ListaDeStringOuFalse é
;; 1. Uma ListaDeString, ou
;; 2. #false

;; vizinhos.v2: String Grafo ListaDeString -> ListaDeString
;; Dados o nome de um nodo, um grafo e uma lista de nodos (já visitados),
;; devolve os nomes de todos os nodos vizinhos do nodo dado que não estão
;; na lista de nodos ja visitados
;; Obs.: O nodo dado deve fazer parte do grafo
;; Exemplos:
;; (vizinhos.v2 "Chicago" GrafoG (list "Denver")) = (list "Toronto")
;; (vizinhos.v2 "A" GrafoABCD (list "B")) = (list "C")
(define (vizinhos.v2 nome grafo lista)
 (subtrai-lista (vizinhos nome grafo) lista))
;; Testes:
(check-expect (vizinhos.v2 "Chicago" GrafoG (list "Denver")) (list "Toronto"))
(check-expect (vizinhos.v2 "Toronto" GrafoG (list "Chicago")) (list "Duluth" "Pittsburgh"))
(check-expect (vizinhos.v2 "A" GrafoABCD (list "B")) (list "C"))

;; encontra-caminho: String String Grafo ListaDeString -> ListaDeStringOuFalse
;; Dados os nome das cidades origem e destino, um grafo (mapa) e uma lista de cidades já visitadas,
;; encontra um caminho entre a origem e o destino. Se não existir caminho, devolve false.
;; Obs.: As cidades dadas devem fazer parte do grafo.
;; Exemplos:
;; (encontra-caminhos "A" "D" GrafoABCD empty) = (list "A" "B" "C" "D")
;; (encontra-caminhos "Duluth" "Pittsburgh" GrafoG empty) = (list "Duluth" "Toronto" "Pittsburgh")
(define (encontra-caminhos origem destino grafo visitadas)
  (cond
    ;; Se a origem for igual ao destino, retornar a lista com o destino.
    [(string=? origem destino) (list destino)]
    ;; senão
    [else
    ;; definir um nome local (visitadas-novo) que guarda os vsitados, incluindo a origem
     ;; (que agora é um nodo já visitado) e outro nome que guarda um caminho entre um dos
     ;; vizinhos não visitados do nodo origem e o destino, se existir caminho::
     (local
       ((define visitadas-novo (cons origem visitadas))
        (define caminho
          (encontra-caminho-vizinhos (vizinhos.v2 origem grafo visitadas) destino grafo visitadas-novo)
            ))
       (cond  ;; e testar este nome local (caminho)
         ;; se o nome for um booleano (não há caminho), devolver false
         [(boolean? caminho) false]
         ;; se o caminho for uma lista (foi encontrado um caminho), devolver este
         ;; caminho, colocando o nodo origem na frente
         [else (cons origem caminho)]))]))
;; Testes:
(check-expect (encontra-caminhos "A" "D" GrafoABCD empty) (list "A" "B" "C" "D"))
(check-expect (encontra-caminhos "Duluth" "Pittsburgh" GrafoG empty) (list "Duluth" "Toronto" "Pittsburgh"))



;; encontra-caminho-vizinhos: ListaDeString String Grafo ListaDeString -> ListaDeStringOuFalse
;; Dados uma lista de cidades origem, um destino, um grafo (mapa) e uma lista de cidades já visitadas,
;; encontra um caminho entre alguma das origens e o destino. Se não existir caminho, devolve false.
;; Obs.: As cidades dadas devem fazer parte do grafo.
(define (encontra-caminho-vizinhos listaOrigens destino grafo visitadas)
  (cond
    ;; Se a lista de origens for vazia, retornar false.
    [(empty? listaOrigens) false]
    ;; senão
    [else
     ;; definir um nome local que guarda um caminho entre o primeiro nodo da lista de origens
     ;; e o destino, não passando pelos nodos já visitados, se não existir caminho false é armazenado
     (local 
       ((define caminho (encontra-caminhos (first listaOrigens) destino grafo visitadas)))
	    (cond ;; e testar este nome local (caminho):
              ;; se o caminho for uma lista (foi encontrado um caminho), devolver este
              ;; caminho
              [(list? caminho) caminho]
              ;; senão, procurar um caminho entre um nodo do resto da lista de origens
              ;; até o destino
	      [else (encontra-caminho-vizinhos (rest listaOrigens) destino grafo visitadas)]
              ))]))
;; Testes:


;; Um elemento do conjunto ListaDeListaDeString é
;; 1. a lista vazia (empty); ou
;; 2. (cons lds ldlds), onde:
;; lds: ListaDeString
;; ldlds: ListadeListaDeString
;; Exemplo:
(define ldlds1 (list empty (list "A") (list "B" "C")))

;; monta-caminhos: String ListaDeListaDeString -> ListaDeListaDeString
;; Dados um nome e uma lista de listas de strings, devolve uma lista de listas,
;; onde cada uma das listas tem como primeiro elemento o nome dado na
;; entrada.
;; Exemplos:
;; (monta-caminhos "A" (list (list "B" "C") (list "D)) = (list (list "A" "B" "C") (list "A" "D"))
;; (monta-caminhos "A" empty) = empty
(define (monta-caminhos nome lista)
  (cond
    ;; Se a lista lista estiver vazia, retornar a lista vazia.
    [(empty? lista) empty]
    ;; senão 
    [else ;; constrói uma lista com 
     (cons
      ;; a lista gerada colocando nome na frente da primeira lista de lista
      (cons nome (first lista ))
      ;; e com as listas geradas colocando nome na frente das outras listas de lista.
      (monta-caminhos nome (rest lista )))]))

;; encontra-todos-caminhos String String Grafo -> ListaDeListaDeStringOuFalse
;; Dados os nomes das cidade de origem e destino, um grafo (mapa) e uma lista de cidades já visitadas,
;; encontra um caminho entre a origem e o destino. Se não existir um caminho, devolve false.
(define (encontra-todos-caminhos origem destino grafo)


;; encontra-todos-caminhos: String String Grafo -> ListaDeStringOuFalse
;; Dados os nome das cidades origem e destino, um grafo (mapa) e uma lista de cidades já visitadas,
;; encontra um caminho entre a origem e o destino. Se não existir caminho, devolve false.
;; Obs.: As cidades dadas devem fazer parte do grafo.
;; Exemplos:
;; (encontra-caminhos "A" "D" GrafoABCD empty) = (list "A" "B" "C" "D")
;; (encontra-caminhos "Duluth" "Pittsburgh" GrafoG empty) = (list "Duluth" "Toronto" "Pittsburgh")
(define (encontra-caminhos origem destino grafo visitadas)
  (cond
    ;; Se a origem for igual ao destino, retornar a lista com o destino.
    [(string=? origem destino) (list destino)]
    ;; senão
    [else
    ;; definir um nome local (visitadas-novo) que guarda os vsitados, incluindo a origem
     ;; (que agora é um nodo já visitado) e outro nome que guarda um caminho entre um dos
     ;; vizinhos não visitados do nodo origem e o destino, se existir caminho::
     (local
       ((define visitadas-novo (cons origem visitadas))
        (define caminho
          (encontra-caminho-vizinhos (vizinhos.v2 origem grafo visitadas) destino grafo visitadas-novo)
            ))
       (cond  ;; e testar este nome local (caminho)
         ;; se o nome for um booleano (não há caminho), devolver false
         [(boolean? caminho) false]
         ;; se o caminho for uma lista (foi encontrado um caminho), devolver este
         ;; caminho, colocando o nodo origem na frente
         [else (cons origem caminho)]))]))
;; Testes:
(check-expect (encontra-caminhos "A" "D" GrafoABCD empty) (list "A" "B" "C" "D"))
(check-expect (encontra-caminhos "Duluth" "Pittsburgh" GrafoG empty) (list "Duluth" "Toronto" "Pittsburgh"))



;; encontra-caminho-vizinhos: ListaDeString String Grafo ListaDeString -> ListaDeStringOuFalse
;; Dados uma lista de cidades origem, um destino, um grafo (mapa) e uma lista de cidades já visitadas,
;; encontra um caminho entre alguma das origens e o destino. Se não existir caminho, devolve false.
;; Obs.: As cidades dadas devem fazer parte do grafo.
(define (encontra-caminho-vizinhos listaOrigens destino grafo visitadas)
  (cond
    ;; Se a lista de origens for vazia, retornar false.
    [(empty? listaOrigens) false]
    ;; senão
    [else
     ;; definir um nome local que guarda um caminho entre o primeiro nodo da lista de origens
     ;; e o destino, não passando pelos nodos já visitados, se não existir caminho false é armazenado
     (local 
       ((define caminho (encontra-caminhos (first listaOrigens) destino grafo visitadas)))
	    (cond ;; e testar este nome local (caminho):
              ;; se o caminho for uma lista (foi encontrado um caminho), devolver este
              ;; caminho
              [(list? caminho) caminho]
              ;; senão, procurar um caminho entre um nodo do resto da lista de origens
              ;; até o destino
	      [else (encontra-caminho-vizinhos (rest listaOrigens) destino grafo visitadas)]
              ))]))
;; Testes:

