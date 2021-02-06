;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname listaCap9-ArthurHenriqueWiebusch-D) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

(define-struct carro (ano modelo valor ac ve di))
;; Um elemento do conjunot carro tem o formato:
;;     (make-carro a m v ac ve di)
;; onde:
;; a: numero, representa o ano de fabricação do carro
;; m: string, representa o modelo do carro
;; v: numero, representa o valor de mercado do carro
;; ac: booleano, indica se o carro tem ou não ar-condicionado
;; ve: booleano, indica se o carro tem vidros elétricos
;; di: booleam, indica se o carro tem direção hidráulica

(define carro1 (make-carro 2008 "Honda FIT" 25000 true true true))
(define carro2 (make-carro 2000 "FIAT Palio" 11000 false false false))
(define carro3 (make-carro 2015 "Porscche Panamera" 390000 true true true))
(define carro4 (make-carro 2019 "Volkswagen Gol" 40900 true true true))
(define carro5 (make-carro 2007 "Chevrolet Celta" 10900 false false true))


;; Um Cadastro pode ser
;; 1.a lista vazia(empty) ou
;; 2.(cons c cad), onde:
;;   c: carro
;;   cad: Cadastro

;; ==============================================================================
;; 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2


;; temAC?: Cadastro -> Booleano
;; verifica se algum carro no Cadastro fornecido tem ar condicionado e
;; retorna true caso tenha e false caso contrario.
;; Exemplos:
;; (temAC? empty) = false
;; (temAC? (cons carro1 empty) = true
;; (temAC? (cons carro2 (cons carro1 empty))) = true
;; (temAC? (cons carro2 (cons carro5 empty))) = false
(define (temAC? lista)
  (cond
    ;; caso a lista esteja vazia nenhum carro tem ar condicionado
    [(empty? lista) false]
    ;; caso contrario testar todos carros e se algum deles tiver ar condicionado
    ;; retornar true
    [else (or (carro-ac (first lista)) (temAC? (rest lista)))]))
;; Testes:
(check-expect (temAC? empty) false)
(check-expect (temAC? (cons carro1 empty)) true)
(check-expect (temAC? (cons carro2 (cons carro1 empty))) true)
(check-expect (temAC? (cons carro2 (cons carro5 empty))) false)

;; temAC?.v2: Cadastro -> Booleano
;; verifica se algum carro no Cadastro fornecido tem ar condicionado e
;; retorna true caso tenha e false caso contrario.
;; Exemplos:
;; (temAC?.v2 empty) = false
;; (temAC?.v2 (cons carro1 empty) = true
;; (temAC?.v2 (cons carro1 (cons carro2 empty))) = true
;; (temAC?.v2 (cons carro2 (cons carro5 empty))) = false
(define (temAC?.v2 lista)
  (cond
    ;; caso a lista esteja vazia retornar falso
    [(empty? lista) false]
    ;; caso contrario
    [else (cond
            ;; verificar se o primerio elemento tem ar condicionado
            [(boolean=? true (carro-ac (first lista))) true]
            ;; senão repetir o processo
            [else (temAC?.v2 (rest lista))])]))
;; Testes:
(check-expect (temAC?.v2 empty) false)
(check-expect (temAC?.v2 (cons carro1 empty)) true)
(check-expect (temAC?.v2 (cons carro2 (cons carro1 empty))) true)
(check-expect (temAC?.v2 (cons carro2 (cons carro5 empty))) false)
;; A versão 2 da função temAC? é util caso tenhamos uma lista muito grande de
;; carros, pois caso hajam por exemplo 1000 carros ela não necessariamente irá
;; testar todos, uma vez que quando acha um carro que tem ar condicionado ela já
;; retorna true e interrompe a execução

;; ==============================================================================
;; 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3


;; quantosVE: Cadastro -> Número
;; dado um Cadastro retorna o número de carros dentroe dele que possuem vidros
;; elétricos
;; (quantosVE empty) = 0
;; (quantosVE (cons carro1 empty) = 1
;; (quantosVE (cons carro1 (cons carro2 empty))) = 1
;; (quantosVE (cons carro1 (cons carro2 (cons carro3 empty)))) = 2
;; (quantosVE (cons carro1 (cons carro2 (cons carro3 (cons carro4 (cons carro5 empty)))))) = 3
(define (quantosVE lista)
  (cond
    ;; se o cadastro for vazio nenhum carro tem ar condicionado
    [(empty? lista) 0]
    ;; senao 
    [else (+
           (cond
             ;; se o carro da posicao 1 tem ar condiconado somar 1
             [(carro-ve (first lista)) 1]
             ;; senao somar 0
             [else 0])
           ;; somar o resultado aos resultados dos proximos carros do cadastro
           (quantosVE (rest lista)))]))
;; Testes:
(check-expect (quantosVE empty) 0)
(check-expect (quantosVE (cons carro1 empty)) 1)
(check-expect (quantosVE (cons carro2 (cons carro1 empty))) 1)
(check-expect (quantosVE (cons carro3 (cons carro2(cons carro1 empty)))) 2)
(check-expect (quantosVE (cons carro5 (cons carro4 (cons carro3 (cons carro2 (cons carro1 empty)))))) 3)

;; =============================================================================
;; 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 


;; valor: Cadastro -> Número
;; dado um Cadastro, devolve a soma dos valores de mercado de todos os carros
;; dentro dele
;; Exemplos:
;; (valor empty) = 0
;; (valor (cons carro1 empty)) = 25000
;; (valor (cons carro2 (cons carro1 empty))) = 36000
;; (valor (cons carro3 (cons carro2 (cons carro1 empty)))) = 426000
(define (valor lista)
  (cond
    ;; se a lista estiver vazia o valor é 0
    [(empty? lista) 0]
    ;; senao somar o valor do primeiro carro da lista a soma dos valores dos
    ;; proximos dos carros da lista
    [else (+ (carro-valor (first lista)) (valor (rest lista)))]))
;; Testes:
(check-expect (valor empty) 0)
(check-expect (valor (cons carro1 empty)) 25000)
(check-expect (valor (cons carro2 (cons carro1 empty))) 36000)
(check-expect (valor (cons carro3 (cons carro2 (cons carro1 empty)))) 426000)

;; =============================================================================
;; 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5

;; Tipo CarrouOuString:
;; Um elemento do conjunto CarroOuString é
;; 1. um elemento do conjunto carro; ou
;; 2. uma string;


;; constantes para testes
(define carro1comdesconto (make-carro 2008 "Honda FIT" 22500 true true true))
(define carro2comdesconto (make-carro 2000 "FIAT Palio" 9900 false false false))
(define carro3comdesconto (make-carro 2015 "Porscche Panamera" 351000 true true true))
(define carro4comdesconto (make-carro 2019 "Volkswagen Gol" 36810 true true true))
(define carro5comdesconto (make-carro 2007 "Chevrolet Celta" 9810 false false true))


;; desconto: carro -> carro
;; dado um carro, retorna ele com valor de mercado decrescido de 10%
;; Exemplos:
;; (desconto carro1) = carro1comdesconto
;; (desconto carro2) = carro2comdesconto
;; (desconto carro3) = carro3comdesconto
;; (desconto carro4) = carro4comdesconto
;; (desconto carro5) = carro5comdesconto
(define (desconto carro)
  (make-carro
   (carro-ano carro)
   (carro-modelo carro)
   (* 0.9 (carro-valor carro))
   (carro-ac carro)
   (carro-ve carro)
   (carro-di carro)))
;; Testes:
(check-expect (desconto carro1) carro1comdesconto)
(check-expect (desconto carro2) carro2comdesconto)
(check-expect (desconto carro3) carro3comdesconto)
(check-expect (desconto carro4) carro4comdesconto)
(check-expect (desconto carro5) carro5comdesconto)
   

;; decValor: Cadastro Número -> CarroOuString
;; dado um Cadastro e um Número representando o ano corrente, caso o Cadastro
;; possua um Carro com ano de fabricação igual ao ano corrente, retorna ele com
;; valor de mercado decrescido de 10%, caso contrário, retorna "não há carros
;; deste ano no cadastro".
;; Exemplos:
;; (decValor empty 2020) = "não há carros deste ano no cadastro"
;; (decValor (cons carro1 empty) 2020) = "não há carros deste ano no cadastro"
;; (decValor (cons carro1 (cons carro4 empty) 2019) = carro4comdesconto
;; (decValor (cons carro1 (cons carro2 (cons carro3 (cons carro5 empty)))) 2015) = carro3comdesconto
(define (decValor lista ano)
  (cond
    ;; se a lista estiver vazia retorna a mensagem que não há carros deste ano
    ;; no cadastro
    [(empty? lista) "não há carros deste ano no cadastro"]
    ;; senao
    [else (cond
            ;; se o carro da lista tiver ano de fabricacao igual ao do ano
            ;; corrente retorna ele com valor de mercado decrescido de 10%
            [(= (carro-ano (first lista)) ano) (desconto (first lista))]
            ;; senao testa o resto da lista
            [else (decValor (rest lista) ano)])]))
;; Testes:
(check-expect (decValor empty 2020) "não há carros deste ano no cadastro")
(check-expect (decValor (cons carro1 empty) 2020) "não há carros deste ano no cadastro")
(check-expect (decValor (cons carro1 (cons carro4 empty)) 2019) carro4comdesconto)
(check-expect (decValor (cons carro1 (cons carro2 (cons carro3 (cons carro5 empty)))) 2015) carro3comdesconto)






     

