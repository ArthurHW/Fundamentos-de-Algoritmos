;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname listaCap28-ArthurHenriqueWiebusch-D) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; Uma ListaDeString é
;; 1. A lista vazia (empty); ou
;; 2. (cons s lds), onde:
;; s: String
;; lds: ListaDeString

(define-struct nodo (nome vizinhos))
;; Um elemento do conjunto Nodo é um par
;; (make-nodo n v), onde
;; n : String, representa o nome do nodo
;; v : ListaDeString, representa os (nomes dos) nodos vizinhos

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

(define LISTAABC (list "A" "B" "C"))
(define LISTABCD (list "B" "C" "D"))

;; ===========================================================================================================
;; 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
;; ===========================================================================================================

(define MAPA (list
              (make-nodo "Winnipeg" (list "Sault Ste. Marie" "Duluth" "Helena"))
              (make-nodo "Helena" (list "Duluth" "Winnipeg" "Omaha" "Denver"))
              (make-nodo "Denver" (list "Helena" "Omaha" "Kansas City" "Santa Fe" "Oklahoma City")) 
              (make-nodo "Santa Fe" (list "Denver" "Oklahoma City"))
              (make-nodo "Oklahoma City" (list "Santa Fe" "Denver" "Kansas City" "Little Rock"))
              (make-nodo "Kansas City" (list "Omaha" "Denver" "Oklahoma City" "Saint Louis"))
              (make-nodo "Omaha" (list "Duluth" "Helena" "Denver" "Kansas City" "Chicago"))
              (make-nodo "Duluth" (list "Winnipeg" "Helena" "Omaha" "Sault Ste. Marie" "Toronto" "Chicago"))
              (make-nodo "Sault Ste. Marie" (list "Winnipeg" "Duluth" "Toronto"))
              (make-nodo "Toronto" (list "Sault Ste. Marie" "Duluth" "Pittsburgh" "Chicago"))
              (make-nodo "Chicago" (list "Duluth" "Toronto" "Pittsburgh" "Saint Louis" "Omaha"))
              (make-nodo "Saint Louis" (list "Kansas City" "Chicago" "Pittsburgh" "Nashville" "Little Rock"))
              (make-nodo "Little Rock" (list "Oklahoma City" "Saint Louis" "Nashville"))
              (make-nodo "Nashville" (list "Saint Louis" "Little Rock" "Atlanta" "Pittsburgh"))
              (make-nodo "Atlanta" (list "Nashville"))
              (make-nodo "Pittsburgh" (list "Toronto" "Chicago" "Saint Louis" "Nashville"))))


;; ===========================================================================================================
;; 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
;; ===========================================================================================================

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

;; Argumentação de terminação da função está-na-lista?:
;; A função está-na-lista? termina, pois a cada recursão, a função é chamada com uma lista menor
;; que a lista original, e como um dos critérios de parada é a lista vazia, dado um certo tempo,
;; a função necessariamente irá terminar

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

;; Argumentação de terminação da função subtra-lista:
;; A função subtrai-lista termina, pois a cada recursão a função é chamada com a lista um subtraida
;; de um termo, e como uma das condições de parada é a lista1 estar vazia, e como a função sempre se aproxima
;; de a lista1 ser vazia, então em dado intervalo finito de tempo a função irá terminar

;; ===========================================================================================================
;; 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
;; ===========================================================================================================

;; vizinhos: String Grafo ListaDeString -> ListaDeString
;; Dados o nome de um nodo, um grafo e uma lista com nomes de nodos (já visitados)
;; devolve uma lista com os nomes dos nodos que não constam na lista dada, nessa lista
;; estão os vizinhos do nodo dado que ainda não foram visitados
;; Exemplos:
;; (vizinhos "Chicago" GrafoG empty) = (list "Toronto")
;; (vizinhos "A" GrafoABCD (list "B")) = (list "B" "C")
(define (vizinhos nome grafo lista)
 (cond
   ;; Se o grafo grafo estiver vazio, retornar a lista vazia.
   [(empty? grafo) empty]
   ;; Se o nome do primeiro nodo do grafo for igual ao nome dado, devolve os vizinhos deste nodo,
   ;; subtraidos da lista de nodos ja visitados
   [(string=? nome (nodo-nome (first grafo))) (subtrai-lista (nodo-vizinhos (first grafo)) lista)]
   ;; senão, procura os vizinhos do nodo com o nome dado nos outros nodos do grafo.
   [else (vizinhos nome (rest grafo ) lista)]))
;; Testes:
(check-expect (vizinhos "Chicago" GrafoG empty) (list "Toronto"))
(check-expect (vizinhos "Toronto" GrafoG (list "Duluth")) (list "Chicago" "Pittsburgh"))
(check-expect (vizinhos "A" GrafoABCD (list "B")) (list "C"))

;; Argumentação de terminação da função vizinhos:
;; Como uma das condições de parada é o grafo ser uma lista vazia e a cada recursão a função é chamada com um grafo
;; com um termo a menos que o grafo original, então em algum momento o grafo será vazio e a função irá terminar.

;; ===========================================================================================================
;; 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 
;; ===========================================================================================================

;; Um elemento do tipo ListaDeStringOuFalse é
;; 1. Uma ListaDeString, ou
;; 2. #false

;; encontra-caminho: String String Grafo ListaDeString -> ListaDeStringOuFalse
;; Dados os nome das cidades origem e destino, um grafo (mapa) e uma lista de cidades já visitadas,
;; encontra um caminho entre a origem e o destino. Se não existir caminho, devolve false.
;; Obs.: As cidades dadas devem fazer parte do grafo.
;; Exemplos:
;; (encontra-caminho "A" "D" GrafoABCD empty) = (list "A" "B" "C" "D")
;; (encontra-caminho "Duluth" "Pittsburgh" GrafoG empty) = (list "Duluth" "Toronto" "Pittsburgh")
(define (encontra-caminho origem destino grafo visitadas)
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
          (encontra-caminho-vizinhos (vizinhos origem grafo visitadas) destino grafo visitadas-novo)
            ))
       (cond  ;; e testar este nome local (caminho)
         ;; se o nome for um booleano (não há caminho), devolver false
         [(boolean? caminho) false]
         ;; se o caminho for uma lista (foi encontrado um caminho), devolver este
         ;; caminho, colocando o nodo origem na frente
         [else (cons origem caminho)]))]))
;; Testes:
(check-expect (encontra-caminho "A" "D" GrafoABCD empty) (list "A" "B" "C" "D"))
(check-expect (encontra-caminho "Duluth" "Pittsburgh" GrafoG empty) (list "Duluth" "Toronto" "Pittsburgh"))
(check-expect (encontra-caminho "Winnipeg" "Sault Ste. Marie" MAPA empty) (list "Winnipeg" "Sault Ste. Marie"))


;; encontra-caminho-vizinhos: ListaDeString String Grafo ListaDeString -> ListaDeStringOuFalse
;; Dados uma lista de cidades origem, um destino, um grafo (mapa) e uma lista de cidades já visitadas,
;; encontra um caminho entre alguma das origens e o destino. Se não existir caminho, devolve false.
;; Obs.: As cidades dadas devem fazer parte do grafo.
;; Exemplos:
;; (encontra-caminho-vizinhos (list "Duluth") "Pittsburgh" GrafoG empty) = (list "Duluth" "Toronto" "Pittsburgh")
;; (encontra-caminho-vizinhos (list "A" "B") "D" GrafoABCD empty) = (list "A" "B" "C" "D")
(define (encontra-caminho-vizinhos listaOrigens destino grafo visitadas)
  (cond
    ;; Se a lista de origens for vazia, retornar false.
    [(empty? listaOrigens) false]
    ;; senão
    [else
     ;; definir um nome local que guarda um caminho entre o primeiro nodo da lista de origens
     ;; e o destino, não passando pelos nodos já visitados, se não existir caminho false é armazenado
     (local 
       ((define caminho (encontra-caminho (first listaOrigens) destino grafo visitadas)))
	    (cond ;; e testar este nome local (caminho):
              ;; se o caminho for uma lista (foi encontrado um caminho), devolver este
              ;; caminho
              [(list? caminho) caminho]
              ;; senão, procurar um caminho entre um nodo do resto da lista de origens
              ;; até o destino
	      [else (encontra-caminho-vizinhos (rest listaOrigens) destino grafo visitadas)]
              ))]))
;; Testes:
(check-expect (encontra-caminho-vizinhos (list "A" "B") "D" GrafoABCD empty) (list "A" "B" "C" "D"))
(check-expect (encontra-caminho-vizinhos (list "Duluth") "Pittsburgh" GrafoG empty) (list "Duluth" "Toronto" "Pittsburgh"))
(check-expect (encontra-caminho-vizinhos (list "Toronto" "Winnipeg") "Omaha" MAPA empty) (list "Toronto" "Sault Ste. Marie" "Winnipeg" "Duluth" "Helena" "Omaha"))

;; Argumentação de terminação das funções encontra-caminho e encontra-caminho-vizinhos:
;; As funções terminam, pois a função encontra-caminho chama a função encontra-caminho-vizinhos, com uma cidade visitada a mais
;; e como as funções não verificam as cidades ja visitadas, as funções estão sempre mais proximas de encerrar, a cada recursão.
;; A função encontra-caminho-vizinhos chama a função encontra caminho com um dos vizinhos e depois testa somente o resto dos
;; vizinhos. Se a função achar um caminho ela termina e se não achar ela testa o proximo, se não houver um caminho, a função testará
;; caminhos de todos os vizinhos da origem para o destinho e em algum momento a função encontra-caminho-vizinhos irá retornar false
;; e portanto a função encontra-caminho irá retornar false e ela irá encerrar, portanto ela sempre termina em um dado tempo finito.


;; ===========================================================================================================
;; 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
;; ===========================================================================================================

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
;; (monta-caminhos "A" (list (list "B" "C") (list "D"))) = (list (list "A" "B" "C") (list "A" "D"))
;; (monta-caminhos "A" empty) = empty
(define (monta-caminhos nome lista)
  (map (lambda (l) (cons nome l)) lista))
;; Testes:
(check-expect (monta-caminhos "A" (list (list "B" "C") (list "D"))) (list (list "A" "B" "C") (list "A" "D")))
(check-expect (monta-caminhos "A" empty) empty)

;; encontra-todos-caminhos: String String Grafo -> ListaDeListaDeString
;; Dados o nome do nodo origem, o nome do destino e um grafo, nesta ordem, retorna uma lista de caminhos, onde cada caminho é
;; é representado por uma lista de string
;; Exemplos:
;; (encontra-todos-caminhos "A" "D" GrafoABCD) = (list (list "A" "B" "C" "D") (list "A" "C" "D"))
;; (encontra-todos-caminhos "D" "A" GrafoABCD) = (list (list "D" "C" "B" "A"))
(define (encontra-todos-caminhos origem destino G)
  (local (
          ;; encontra-caminhos-nodo: String ListaDeString -> ListaDeListaDeString
          ;; Dados a origem e uma lista de cidades já visitadas, retorna uma lista de caminhos da origem
          ;; ao destino especificado na função encontra-todos-caminhos
          (define (encontra-caminhos-nodo origem visitadas)
            (cond
              ;; se a origem é igual ao destino, retorna uma lista com um caminho até o destino
              ;; que nesse caso só possui um elemento
              [(string=? origem destino) (list (list destino))]
              ;; se a origem ja foi visitada esse caminho não é valido, pois temos um loop
              [(está-na-lista? origem visitadas) empty] 
              [else ;; senão
               (local
                 ;; criar uma definição local chamada caminhos-possiveis, que encontra os caminhos dos
                 ;; vizinhos da origem ate o destino
                 ((define caminhos-possiveis 
                    (encontra-caminhos-lista (vizinhos origem G visitadas) (cons origem visitadas))))
                 ;; coloca a origem na frente de todos os caminhos dos vizinhos ate--o destino encontrados
                 ;; formando assim uma lista de caminhos da origem ate o destino
                 (monta-caminhos origem caminhos-possiveis))]))

          ;; encontra-caminhos-lista: ListaDeString ListaDeString -> ListaDeListaDeString
          ;; Dada uma lista de vizinhos de uma cidade e uma lista de cidades ja visitadas, retorna uma lista
          ;; de caminhos destes vizinhos ate o destino, que não passam pelas cidades já visitadas
          (define (encontra-caminhos-lista lista visitadas)
            (cond
              ;; se a lista dada for vazia, não há caminhos, retorna uma lista vazia
              [(empty? lista) empty]
                  [else ;; senão
                   (local
                          ;; a definição local caminho, é um possivel caminho entre o primeiro elemento da
                          ;; da lista e o destino
                          ((define caminho (encontra-caminhos-nodo (first lista) visitadas)))
                          (cond
                            ;; se não houver nenhum caminho, para o primeiro elemento da lista de vizinhos
                            ;; testa se existem caminhos partindo dos outros elementos da lista ate o destino
                            [(empty? caminho) (encontra-caminhos-lista (rest lista) visitadas)]
                            ;; senão
                                [else
                                 ;; junta o caminho encontrado
                                  (append caminho
                                          ;; com os caminhos possiveis partindo dos outros elementos da lista
                                          (encontra-caminhos-lista (rest lista) visitadas))]))])))
    ;; e no final, depois de todas as definições, chama a função encontra-caminhos-nodo, partindo da origem com
    ;; uma lista de cidades visitadas vazia
    (encontra-caminhos-nodo origem empty)))
;; Testes:
(check-expect (length (encontra-todos-caminhos "Chicago" "Toronto" MAPA)) 1528)
(check-expect (encontra-todos-caminhos "A" "D" GrafoABCD) (list (list "A" "B" "C" "D") (list "A" "C" "D")))
(check-expect (encontra-todos-caminhos "D" "A" GrafoABCD) (list (list "D" "C" "B" "A")))

;; (encontra-todos-caminhos "Chicago" "Toronto" MAPA)
;; (encontra-todos-caminhos "Omaha" "Pittsburgh" MAPA)
;; (length (encontra-todos-caminhos "Pittsburgh" "Omaha" MAPA))

;; Argumentação de terminação da função encontra-todos-caminhos:
;; A função encontra-todos-caminhos encerra se as funções definidas localmente encontra-caminhos-nodo e encontra-caminhos-lista
;; terminam. A função encontra-caminhos nodo sempre adiciona uma cidade a lista de cidades visitadas e como as funções não verificam
;; as cidades que já foram visitadas, elas estão mais proximas de encerrar a cada recursao. A funcao encontra-caminhos-lista, tenta achar
;; chama a função encontra-caminhos-nodo com o primeiro elemento da lista e depois procura caminhos dos outros elementos da lista
;; de vizinhos ate o destino, como existe um numero finito de caminhos, em algum momento o programa tera tentado percorrer todos os
;; os caminhos que nao repetem nenhuma cidade e irá terminar.

;; ===========================================================================================================
;; 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6
;; ===========================================================================================================

;; mostra-caminhos: String String Grafo -> String
;; dadas uma cidade de origem, uma de destino e um grafo , nesta ordem, gera um string contendo na primeira
;; linha o número de caminhos existentes da cidade origem até a destino e depois a lista de todos os caminhos.
;; Exemplos:
;; (mostra-caminhos "D" "A" GrafoABCD) = "Número de caminhos entre D e A: 1\n1. D -> C -> B -> A -> \nFim.\n"
;; (mostra-caminhos "A" "D" GrafoABCD) = "Número de caminhos entre A e D: 2\n1. A -> B -> C -> D -> \n2. A -> C -> D -> \nFim.\n"
(define (mostra-caminhos origem destino grafo)
  (local (
          ;; a definição local todos os caminhos, guarda a lista com todos os caminhos possiveis entre a origem e o destino
          (define todos-caminhos (encontra-todos-caminhos origem destino grafo))
          ;; mostra-caminho: ListaDeString -> String
          ;; dada uma lista de string, gera uma visualização para este caminho, colocando setas entre os elementos, indicando
          ;; a direção do caminho.
          (define (mostra-caminho caminho) (cond
                                             ;; se o caminho for vazio, quebra a linha
                                             [(empty? caminho) "\n"]
                                             ;; se o proximo elemento for vazio, coloca o primeiro elemento e uma quebra de linha
                                             [(empty? (rest caminho)) (string-append (first caminho) "\n")]
                                             ;; senão coloca o primeiro elemento e uma seta indicando a direção do caminho, junto
                                             ;; com o resto do caminho
                                             [else (string-append (first caminho) " -> " (mostra-caminho (rest caminho)))]))
          ;; lista-caminhos: ListaDeListaDeString Número -> String
          ;; Dada uma lista de caminho e um número, gera uma string com uma visualização de todos os caminhos da origem ate o destino
          (define (lista-caminhos lista contador) (cond
                                                    ;; Quando não houverem mais caminhos, coloca a palavra Fim. na string
                                                    [(empty? lista) "Fim.\n"]
                                                    ;; enquanto houverem caminhos, retorna uma string para o contador, seguida por um caminho
                                                    ;; e pela visualização dos proximos caminhos
                                                    [else (string-append (number->string contador) ". " (mostra-caminho (first lista)) (lista-caminhos (rest lista) (+ contador 1)))]))
            )
    (string-append "Número de caminhos entre " origem " e " destino ": " (number->string (length todos-caminhos)) "\n"
                   (lista-caminhos todos-caminhos 1))))
;; Testes:
(check-expect (mostra-caminhos "A" "D" GrafoABCD) "Número de caminhos entre A e D: 2\n1. A -> B -> C -> D\n2. A -> C -> D\nFim.\n")
(check-expect (mostra-caminhos "D" "A" GrafoABCD) "Número de caminhos entre D e A: 1\n1. D -> C -> B -> A\nFim.\n")
(check-expect (mostra-caminhos "Duluth" "Toronto" GrafoG) "Número de caminhos entre Duluth e Toronto: 1\n1. Duluth -> Toronto\nFim.\n")

;; (display (mostra-caminhos "Chicago" "Toronto" MAPA))


;; ===========================================================================================================
;; 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7  7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7
;; ===========================================================================================================

(define-struct estrada (destino distancia))
;; Um elemento do conjunto Estrada é um par
;; (make-estrada n v), onde
;; n : String, representa o nome da cidade destino da estrada
;; v : Número, representa o comprimento desta estrada (entre origem e este destino)

;; Uma ListaDeEstradas é
;; 1. empty, ou
;; 2. (cons e le), onde e:Estrada e le: ListaDeEstradas

(define-struct cidade (nome vizinhas))
;; Um elemento do conjunto Cidade é um par
;; (make-cidade n v), onde
;; n : String, representa o nome da cidade
;; v : ListaDeEstradas, representa as estradas para cidades vizinhas

;; Um Mapa é
;; 1. empty, ou
;; 2. (cons n g), onde
;; n : Cidade
;; g : Mapa

(define Mapa (list
              (make-cidade "Winnipeg" (list (make-estrada "Sault Ste. Marie" 6) (make-estrada "Duluth" 4) (make-estrada "Helena" 4)))
              (make-cidade "Helena" (list (make-estrada "Winnipeg" 4) (make-estrada "Duluth" 6) (make-estrada "Omaha" 5) (make-estrada "Denver" 4)))
              (make-cidade "Denver" (list (make-estrada "Helena" 4) (make-estrada "Omaha" 4) (make-estrada "Kansas City" 4) (make-estrada "Oklahoma City" 4) (make-estrada "Santa Fé" 2)))
              (make-cidade "Santa Fé" (list (make-estrada "Denver" 2) (make-estrada "Oklahoma City" 3)))
              (make-cidade "Duluth" (list (make-estrada "Winnipeg" 4) (make-estrada "Sault Ste. Marie" 3) (make-estrada "Toronto" 6) (make-estrada "Chicago" 3) (make-estrada "Omaha" 2) (make-estrada "Helena" 6)))
              (make-cidade "Omaha" (list (make-estrada "Duluth" 2) (make-estrada "Helena" 5) (make-estrada "Denver" 4) (make-estrada "Kansas City" 1) (make-estrada "Chicago" 4)))
              (make-cidade "Kansas City" (list (make-estrada "Omaha" 1) (make-estrada "Denver" 4) (make-estrada "Oklahoma City" 2) (make-estrada "Saint Louis" 2)))
              (make-cidade "Oklahoma City" (list (make-estrada "Santa Fé" 3) (make-estrada "Denver" 4) (make-estrada "Kansas City" 2) (make-estrada "Little Rock" 2)))
              (make-cidade "Sault Ste. Marie" (list (make-estrada "Winnipeg" 6) (make-estrada "Duluth" 3) (make-estrada "Toronto" 2)))
              (make-cidade "Toronto" (list (make-estrada "Sault Ste. Marie" 2) (make-estrada "Duluth" 6) (make-estrada "Chicago" 4) (make-estrada "Pittsburgh" 2)))
              (make-cidade "Chicago" (list (make-estrada "Duluth" 3) (make-estrada "Omaha" 4) (make-estrada "Saint Louis" 2) (make-estrada "Pittsburgh" 3) (make-estrada "Toronto" 4)))
              (make-cidade "Saint Louis" (list (make-estrada "Kansas City" 2) (make-estrada "Little Rock" 2) (make-estrada "Nashville" 2) (make-estrada "Pittsburgh" 5) (make-estrada "Chicago" 2)))
              (make-cidade "Little Rock" (list (make-estrada "Oklahoma City" 2) (make-estrada "Saint Louis" 2) (make-estrada "Nashville" 3)))
              (make-cidade "Pittsburgh" (list (make-estrada "Toronto" 2) (make-estrada "Chicago" 3) (make-estrada "Saint Louis" 5) (make-estrada "Nashville" 4)))
              (make-cidade "Nashville" (list (make-estrada "Pittsburgh" 4) (make-estrada "Saint Louis" 2) (make-estrada "Little Rock" 3) (make-estrada "Atlanta" 1)))
              (make-cidade "Atlanta" (list (make-estrada "Nashville" 1)))))
                
(define Exemplo (list
                 (make-cidade "Winnipeg" (list (make-estrada "Helena" 4)))
                 (make-cidade "Helena" (list (make-estrada "Winnipeg" 4)))))

;; vizinhos.v2: String Mapa ListaDeEstradas -> ListaDeEstradas
;; Dados o nome de um nodo, um mapa e uma lista com as estradas que ja foram percorridas
;; devolve uma lista com os nomes das cidades que não constam na lista dada, nessa lista
;; estão os vizinhos do nodo dado que ainda não foram visitados
;; Exemplos:
;; (vizinhos.v2 "Chicago" Mapa empty) = (list "Duluth" "Omaha" "Saint Louis" "Pittsburgh" "Toronto")
;; (vizinhos.v2 "Toronto" Mapa (list "Duluth")) = (list "Sault Ste. Marie" "Chicago" "Pittsburgh"))
(define (vizinhos.v2 nome grafo lista)
 (cond
   ;; Se o grafo grafo (ou mapa) estiver vazio, retornar a lista vazia.
   [(empty? grafo) empty]
   ;; Se o nome da primeira cidade do grafo for igual ao nome dado, devolve os vizinhos desta cidade,
   ;; subtraidos da lista de nodos ja visitados
   [(string=? nome (cidade-nome (first grafo))) (subtrai-lista (map estrada-destino (cidade-vizinhas (first grafo))) lista)]
   ;; senão, procura os vizinhos da cidade com o nome dado nas outras cidades do grafo.
   [else (vizinhos.v2 nome (rest grafo ) lista)]))
;; Testes:
;;(check-expect (vizinhos.v2 "Chicago" Mapa empty) (list "Duluth" "Omaha" "Saint Louis" "Pittsburgh" "Toronto"))
;;(check-expect (vizinhos.v2 "Toronto" Mapa (list "Duluth")) (list "Sault Ste. Marie" "Chicago" "Pittsburgh"))
;;(check-expect (vizinhos.v2 "Pittsburgh" Mapa empty) (list "Toronto" "Chicago" "Saint Louis" "Nashville"))


;; encontra-todos-caminhos.v2: String String Mapa -> ListaDeListaDeString
;; Dados o nome da cidade de origem, o nome da cidade de destino e um mapa, nesta ordem, retorna uma lista de caminhos, onde cada caminho é
;; é representado por uma lista de string
;; Exemplo:
;; (encontra-todos-caminhos.v2 "Helena" "Winnipeg" Exemplo) = (list (list "Helena" "Winnipeg"))
(define (encontra-todos-caminhos.v2 origem destino G)
  (local (
          ;; encontra-caminhos-nodo.v2: String ListaDeString -> ListaDeListaDeString
          ;; Dados a origem e uma lista de cidades já visitadas, retorna uma lista de caminhos da origem
          ;; ao destino especificado na função encontra-todos-caminhos
          (define (encontra-caminhos-nodo.v2 origem visitadas)
            (cond
              ;; se a origem é igual ao destino, retorna uma lista com um caminho até o destino
              ;; que nesse caso só possui um elemento
              [(string=? origem destino) (list (list destino))]
              ;; se a origem ja foi visitada esse caminho não é valido, pois temos um loop
              [(está-na-lista? origem visitadas) empty] 
              [else ;; senão
               (local
                 ;; criar uma definição local chamada caminhos-possiveis, que encontra os caminhos dos
                 ;; vizinhos da origem ate o destino
                 ((define caminhos-possiveis 
                    (encontra-caminhos-lista.v2 (vizinhos.v2 origem G visitadas) (cons origem visitadas))))
                 ;; coloca a origem na frente de todos os caminhos dos vizinhos ate--o destino encontrados
                 ;; formando assim uma lista de caminhos da origem ate o destino
                 (monta-caminhos origem caminhos-possiveis))]))

          ;; encontra-caminhos-lista: ListaDeString ListaDeString -> ListaDeListaDeString
          ;; Dada uma lista de vizinhos de uma cidade e uma lista de cidades ja visitadas, retorna uma lista
          ;; de caminhos destes vizinhos ate o destino, que não passam pelas cidades já visitadas
          (define (encontra-caminhos-lista.v2 lista visitadas)
            (cond
              ;; se a lista dada for vazia, não há caminhos, retorna uma lista vazia
              [(empty? lista) empty]
                  [else ;; senão
                   (local
                          ;; a definição local caminho, é um possivel caminho entre o primeiro elemento da
                          ;; da lista e o destino
                          ((define caminho (encontra-caminhos-nodo.v2 (first lista) visitadas)))
                          (cond
                            ;; se não houver nenhum caminho, para o primeiro elemento da lista de vizinhos
                            ;; testa se existem caminhos partindo dos outros elementos da lista ate o destino
                            [(empty? caminho) (encontra-caminhos-lista.v2 (rest lista) visitadas)]
                            ;; senão
                                [else
                                 ;; junta o caminho encontrado
                                  (append caminho
                                          ;; com os caminhos possiveis partindo dos outros elementos da lista
                                          (encontra-caminhos-lista.v2 (rest lista) visitadas))]))])))
    ;; e no final, depois de todas as definições, chama a função encontra-caminhos-nodo, partindo da origem com
    ;; uma lista de cidades visitadas vazia
    (encontra-caminhos-nodo.v2 origem empty)))
;; Testes:
(check-expect (length (encontra-todos-caminhos.v2 "Omaha" "Pittsburgh" Mapa)) 1141)
(check-expect (encontra-todos-caminhos.v2 "Helena" "Winnipeg" Exemplo) (list (list "Helena" "Winnipeg")))




