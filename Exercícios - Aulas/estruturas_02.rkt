;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname estruturas_02) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; ==============================================================================
;;                                 Estruturas

(define-struct aluno (nome p1 p2 ex))
;; Um elemento do conjunto aluno tem o formato:
;;    (make-aluno nome p1 p2 ex)
;; onde:
;; nome: String, representa o nome do aluno
;; p1: prova, representa a primeira prova do aluno
;; p2: prova, representa a segunda prova do aluno
;; ex: exercicios, representa a nota obtida pelo aluno nos exercícios propostos

(define-struct prova (q1 q2))
;; Um elemento do conjunto prova tem o formato:
;;     (make-prova q1 q2)
;; onde:
;; q1: numero, representa a nota do aluno na questao 1 da prova
;; q2: numero, representa a nota do aluno na questao 2 da prova

(define-struct exercicios (nex1 nex2 pt-extra))
;; Um elemento do conjunto exercicios tem o formato:
;;      (make-exercicios nex1 nex2 pt-extra)
;; onde:
;; nex1: nota-exerc, representa a nota do aluno na primeira nota de exercicios
;; nex2: nota-exerc, representa a nota do aluno na segunda nota de exercicios
;; pt-extra: booleano, representa se o aluno deve ganhar ponto extra ou não

(define-struct nota-exerc (cod doc))
;; Um elemento do conjunto nota_exerc tem o formato:
;;    (make-nota-exerc cod doc)
;; onde:
;; cod: numero, representa a nota do aluno na parte de codificacao do exercicio
;; doc: numero, representa a nota do aluno na parte de documentacao do exercicio

;; ==============================================================================
;;                         Definições de constantes

(define nex1 (make-nota-exerc 2 4))
(define nex2 (make-nota-exerc 1 3))
(define nex3 (make-nota-exerc 3 5))
(define nex4 (make-nota-exerc 5 2))

(define ex1 (make-exercicios nex1 nex2 true))
(define ex2 (make-exercicios nex1 nex2 false))
(define ex3 (make-exercicios nex2 nex3 true))
(define ex4 (make-exercicios nex2 nex3 false))
(define ex5 (make-exercicios nex2 nex4 false))
(define ex6 (make-exercicios nex2 nex4 false))
(define ex7 (make-exercicios nex4 nex3 true))
(define ex8 (make-exercicios nex4 nex2 false))

(define p1 (make-prova 3 4))
(define p2 (make-prova 2 4))
(define p3 (make-prova 2 3))
(define p4 (make-prova 1 4))
(define p5 (make-prova 4 5))
(define p6 (make-prova 5 2))
(define p7 (make-prova 3 2))
(define p8 (make-prova 3 3))
(define p9 (make-prova 2 2))
(define p10 (make-prova 4 3))
(define p11 (make-prova 2 3))
(define p12 (make-prova 4 1))

(define aluno1 (make-aluno "Arthur" p1 p2 ex2))
(define aluno2 (make-aluno "Maicon" p3 p4 ex8))
(define aluno3 (make-aluno "Michele" p5 p6 ex5))
(define aluno4 (make-aluno "Luiza" p7 p8 ex3))
(define aluno5 (make-aluno "Andrei" p9 p10 ex1))
(define aluno6 (make-aluno "Luciano" p11 p12 ex7))

(define aluno1b (make-aluno "Arthur" p1 p2 ex1))
(define aluno2b (make-aluno "Maicon" p3 p4 ex8))
(define aluno3b (make-aluno "Michele" p5 p6 ex5))


;; =============================================================================
;;                                 Funções

;; a)
;; devolve-nome: aluno -> string
;; Dado um aluno, devolve seu nome
;; Exemplos:
;; (devolve-nome (make-aluno "Maicon" px py exz)) =  "Maicon"
;; (devolve-nome (make-aluno "Sabrina" ps pr ext)) = "Sabrina"
(define (devolve-nome aluno)
  (aluno-nome aluno))
;; Testes:
(check-expect (devolve-nome aluno1) "Arthur")
(check-expect (devolve-nome aluno2) "Maicon")
(check-expect (devolve-nome aluno3) "Michele")

;; b)
;; soma-questoes: prova -> numero
;; Dada uma prova,devolve a soma das notas de suas questoes
;; Exemplos:
;; (soma-questoes (make-prova 3 4)) = 7
;; (soma-questoes (make-prova 2 2 )) = 4
(define (soma-questoes prova)
  (+ (prova-q1 prova)
     (prova-q2 prova)))
;; Testes:
(check-expect (soma-questoes p1) 7)
(check-expect (soma-questoes p2) 6)
(check-expect (soma-questoes p3) 5)
(check-expect (soma-questoes p4) 5)

;; c)
;; mprova: aluno -> numero
;; Dado um aluno, devolve a media aritmetica de suas provas
;; Exemplos:
;; (mprova aluno1) = 6.5
;; (mprova aluno2) = 5
(define (mprova aluno)
  (/ (+ (soma-questoes (aluno-p1 aluno))
        (soma-questoes (aluno-p2 aluno)))
     2))
(check-expect (mprova aluno1) 6.5)
(check-expect (mprova aluno2) 5)

;; d)
;; melhor-media: aluno aluno -> aluno
;; dados 2 aluno, devolve o aluno com melhor media aritmetica das provas.
;; Exemplos:
;; (melhor-media aluno1 aluno2) = aluno1
;; (melhor-media aluno3 aluno4) = aluno3
(define (melhor-media alunoa alunob)
  (cond
    [(> (mprova alunoa) (mprova alunob))
     alunoa]
    [else alunob]))
(check-expect (melhor-media aluno1 aluno2) aluno1)
(check-expect (melhor-media aluno4 aluno3) aluno3)

;; e)
;; melhor-nome: aluno aluno -> String
;; Dados 2 alunos, devolve o nome do aluno com melhor média das provas.
;; Exemplos:
;; (melhor-nome aluno1 aluno2) = "Arthur"
;; (melhor-nome aluno3 aluno4) = "Michele"
(define (melhor-nome alunoa alunob)
  (aluno-nome (melhor-media alunoa alunob)))
;; Testes:
(check-expect (melhor-nome aluno1 aluno2) "Arthur")
(check-expect (melhor-nome aluno3 aluno4) "Michele")
 
;; f)
;; ponto-extra: exercicios -> exercicios
;; Dado um registro de exercicios, verifica se o aluno deve ganhar ponto extra:
;; se tiver nota de documentação maior ou igual a 3, nos 2 exercícios, ganha.
;; Exemplos:
;; (ponto-extra ex2) = ex1
;; (ponto-extra ex4) = ex3
;; (ponto-extra ex6) = ex5
(define (ponto-extra exerc)
  (cond
    [(and (>= (nota-exerc-doc (exercicios-nex1 exerc)) 3)
           (>= (nota-exerc-doc (exercicios-nex2 exerc)) 3))
     (make-exercicios
      (exercicios-nex1 exerc)
      (exercicios-nex2 exerc)
      true)]
    [else
     (make-exercicios
      (exercicios-nex1 exerc)
      (exercicios-nex2 exerc)
      false)]))
;; Testes:
(check-expect (ponto-extra ex2) ex1)
(check-expect (ponto-extra ex4) ex3)
(check-expect (ponto-extra ex6) ex5)

;; g)
;; ponto-extra-aluno: aluno -> aluno
;; dado um aluno, registra se ele deve ganhar ponto extra ou não
;; Exemplos:
;; (ponto-extra aluno1) = aluno1b
;; (ponto-extra aluno2) = aluno2b
;; (ponto-extra aluno3) = aluno3b
(define (ponto-extra-aluno aluno)
  (make-aluno
   (aluno-nome aluno)
   (aluno-p1 aluno)
   (aluno-p2 aluno)
   (ponto-extra (aluno-ex aluno))))
;; Testes:
(check-expect (ponto-extra-aluno aluno1) aluno1b)
(check-expect (ponto-extra-aluno aluno2) aluno2b)
(check-expect (ponto-extra-aluno aluno3) aluno3b)

;; h)
;; nota-final: aluno -> numero
;; dado um aluno, calcula sua nota
;;a nota é a média ponderada da prova 1, com peso
;; 4, prova 2, com peso 5, e a nota dos exercícios, com peso 1.
;; A nota dos exercícios deve ser a soma das notas dos exercícios 1 e 2,
;; mais o ponto extra, se for o caso. Para cada exercício, a nota é
;; média aritmética das notas de codificação e documentação.
;; Exemplos:
;; (nota-final aluno1) = 
;; (nota-final aluno2) = 
;; (nota-final aluno3) = 
(define (nota-final aluno)
  (/ ( +
       (* 4 (soma-questoes (aluno-p1 aluno)))
       (* 5 (soma-questoes (aluno-p2 aluno)))
       (* 1 ( +
              (nota-exerc-cod (exercicios-nex1


     10)
  
;; PREGUIÇA



















