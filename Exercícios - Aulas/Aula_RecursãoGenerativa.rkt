;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Aula_RecursãoGenerativa) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; aquicksort: ListaDeNúmeros -> ListaDeNúmeros
;; Dada uma lista de números, ordenar a lista em ordem crescente.
;; Exemplo: (quicksort (list 11 8 14 7)) = (list 7 8 11 14)
(define (aquicksort l)
  (cond
    ;; Se a lista estiver vazi, retornar a própria lista vazia
    [(empty? l) empty]
    ;; Senão
    [else ;; juntar as seguintes listas;
     (append
      ;; a lista ordenada dos elementos da lista l menores que o primeiro
      (aquicksort (menores l (first l)))
      ;; lista dos elementos iguais a l
      (listaIguais l (first l))
      ;; a lista ordenada dos elementos da lista l maiores que o primeiro
      (aquicksort (maiores l (first l))))]))


;; maiores: ListaDeNúmeros Número -> ListaDeNúmeros
;; Dados um número e uma lista de números, devolve todos os elementos da lista
;; maiores que este número.
;; Exemplo: (maiores (list 11 14 7) 8) = (list 11 14)
(define (maiores lista n)
  (cond
    [(empty? lista) empty]
    [(> (first lista) n) (cons (first lista) (maiores (rest lista) n))]
    [else (maiores (rest lista) n)]))

;; menores: ListaDeNúmeros Número -> ListaDeNúmeros
;; Dados um número e uma lista de números, devolve todos os elementos da lista
;; menores que este número.
;; Exemplo: (maiores (list 11 14 7) 8) = (list )
(define (menores lista n)
  (cond
    [(empty? lista) empty]
    [(< (first lista) n) (cons (first lista) (menores (rest lista) n))]
    [else (menores (rest lista) n)]))


;; listaIguais: ListaDeNúmeros Número -> ListaDeNúmeros
;; Dada uma lista de números e um número, devolve uma lista com todos
;; os números iguais ao numero fornecido
(define (listaIguais lista num)
  (cond
    [(empty? lista) empty]
    [(= num (first lista)) (cons (first lista) (listaIguais (rest lista) num))]
    [else (listaIguais (rest lista) num)]))


(define-struct bola (x y incr-x incr-y cor raio))
;; Um elemento do conjunto Bola é
;; (make-bola x y ix iy c r)
;; onde:
;; x : Número, representa a posição no eixo x da bola
;; y : Número, representa a posição no eixo y da bola
;; ix : Número, representa o deslocamento no eixo x da bola
;; iy : Número, representa o deslocamento no eixo y da bola
;; c : String, representa a cor da bola
;; r : Número, representa o raio da bola]

(define LARG 400)
(define ALT 200)


;; move-até-que-fora: Bola -> ListaDeCenas
;; Dada uma bola, gerar a lista de cenas com o deslocamento até que
;; ela fique fora dos limites
(define (move-até-que-fora b)
  (cond
    ;; se a bola b estiver fora dos limites, retornar a lista de cenas vazia
    [(fora-dos-limites? b) empty]
    ;; Senão
    [else;; montar uma lista com as seguintes cenas
     (cons
      ;; o primeiro elemento é a cena com a bola b
      (desenha-cena b)
      ;; as cenas geradas pela movimentação da bola b deslocada
      (move-até-que-fora (move-bola b)))]))

;; desenha-cena: Bola -> Cena
;; Dada uma bola, desenha uma cena com esta bola
(define (desenha-cena uma-bola)
  (place-image
   (circle (bola-raio uma-bola) "solid" (bola-cor uma-bola))
   (bola-x uma-bola)
   (bola-y uma-bola)
   (empty-scene LARG ALT)))

;; fora-dos-limites?: Bola →Boolean
;; Dada uma bola, verifica se ela está dentro dos limites da mesa.
;; Exemplos:
;; (fora-dos-limites? B1) = false
;; (fora-dos-limites? (make-bola -10 -10 5 7 'red 5) ) = true
(define (fora-dos-limites? uma-bola)
  (not
   (and
    ;; a coordenada x da uma-bola está entre 0 e LARG
    (<= 0 (bola-x uma-bola) LARG)
    ;; a coordenada y da uma-bola está entre 0 e ALT
    (<= 0 (bola-y uma-bola) ALT))))

;;move-bola: Bola → Bola
;; Dada uma bola, move esta bola dSe acordo com a definição do seu deslocamento.
;; Exemplos:
;; (move-bola B1) = B2
;; (move-bola (make-bola10 10 3 4 "green" 20)) =
;; (make-bola 13 14 3 4 "green" 20)
(define (move-bola uma-bola)
  (make-bola
   (+ (bola-x uma-bola) (bola-incr-x uma-bola))
   (+ (bola-y uma-bola) (bola-incr-y uma-bola))
   (bola-incr-x uma-bola)
   (bola-incr-y uma-bola)
   (bola-cor uma-bola)
   (bola-raio uma-bola)))

;; move-até-que-fora2: Bola Bola -> ListaDeCenas
;; Dadas duas bolas, gerar a lista de cenas com o deslocamento até que
;; elas fiquem fora dos limites da mesa
(define (move-até-que-fora2 b1 b2)
  (cond
    ;; se a bola b estiver fora dos limites, retornar a lista de cenas vazia
    [(and (fora-dos-limites? b1) (fora-dos-limites? b2)) empty]
    ;; Senão
    [else;; montar uma lista com as seguintes cenas
     (cons
      ;; o primeiro elemento é a cena com a bola b
      (desenha-cena2 b1 b2)
      ;; as cenas geradas pela movimentação da bola b deslocada
      (move-até-que-fora2 (move-bola b1) (move-bola b2)))]))

;; desenha-cena2: Bola Bola -> Cena
;; Dadas duas bolas, desenha uma cena com esta bola
(define (desenha-cena2 b1 b2)
  (place-image
   (circle (bola-raio b2) "solid" (bola-cor b2))
   (bola-x b2)
   (bola-y b2)
   (place-image
    (circle (bola-raio b1) "solid" (bola-cor b1))
    (bola-x b1)
    (bola-y b1)
    (empty-scene LARG ALT))))

(define b1 (make-bola 50 50 2 1 "red" 10))
(define b2 (make-bola 100 100 -3 1 "blue" 20))
  


;; mdc-e: Número Número -> Nùmero
;; dados dois numeros positivos, deolve o MDC dos dois
;; utilizando recursão estrutural
(define (mdc-e a b)
  (local ((define (primeiro-divisor<= i)
	    (cond
              [(= i 1) 1]
	      [else (cond
		      [(and (= (remainder a i) 0) 
			    (= (remainder b i) 0))
		       i]
		      [else (primeiro-divisor<= (- i 1))])])))
    (primeiro-divisor<= (min a b))))
;; Terminação:
;; A função mdc-e termina , pois simplesmente aplica dois valores a função primeiro-divisro<=
;; que devolve um resultado caso a variavel i seja 1 ou o resto dos dois valores na divisao por i
;; seja 0, caso contrario ela é aplicada ao valor i - 1, assumindo que são passados somente valores
;; positivos para a função a função irá terminar, pois valores maiores ou iguais a 1 em algum momento
;; serão 1, nesta função visto a cada recursão ela subtrai uma unidade de i



;; mdc-g: Número Número -> Número
;; dados dois numeros positivos, devolve o MDC dos dois
;; utilizando recursão generativa
(define (mdc-g a b)
  (local ((define (mdc-reduzido maior menor)
	    (cond
	      [(= menor 0) maior]
	      [else (mdc-reduzido menor (remainder maior menor))])))
    (mdc-reduzido (max a b) (min a b))))
;; a função termina, pois o rest da divisao de um numero maior por um numero menor e sempre menor que o menor valor
;; portanto como a condicao de parada é um dos numeros ser igual a zero e como a cada recursão o numero se aproxima
;; mais de 0, entao em algum momento a funcao deve terminar





     
    