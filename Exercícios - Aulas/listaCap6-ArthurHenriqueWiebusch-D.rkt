;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname listaCap6-ArthurHenriqueWiebusch-D) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))

;; 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 

(define-struct InstEnsino (nome ano))
;; Um elemento do conjunto InstEnsino tem o formato:
;;    (make-Inst-Ensino (n a)
;; onde:
;; n: string, representa o nome da instituição
;; a: numero, representa o ano de fundacao da instituição

(define UFRGS (make-InstEnsino "UFRGS" 1895))
(define PUCRS (make-InstEnsino "PUCRS" 1948))

(define-struct Aluno (nome matricula curso instituição))
;; Um elemento do conjunto Aluno tem o formato:
;;    (make-Aluno n m c i)
;; onde:
;; n: string, representa o nome do aluno
;; m: numero, representa o numero de matricula do aluno
;; c: string, representa o nome do curso do aluno
;; i: InstEnsino, representa a instituição de ensino que o aluno esta matriculado

(define aluno1 (make-Aluno "Roberto" 00983457 "CIC" UFRGS))
(define aluno2 (make-Aluno "André" 00638275 "Matemática" UFRGS))
(define aluno3 (make-Aluno "Paola" 00125486 "Letras" PUCRS))

;; ==============================================================================
;; 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2

;; mesmaInstituição?: Aluno Aluno Instituicao
;; dados dois alunos e uma instituião de ensino, verifica se ambos os alunos
;; estão matriculados na instituição fornecida
;; Exemplos:
;; (mesmaInstituição? aluno1 aluno2 UFRGS) = true
;; (mesmaInstituição? aluno1 aluno2 PUCRS) = false
;; (mesmaInstituição? aluno1 aluno3 UFRGS) = false
(define (mesmaInstituição? aluno1 aluno2 inst)
  (and
   (string=? (InstEnsino-nome (Aluno-instituição aluno1))
             (InstEnsino-nome inst))
   (string=? (InstEnsino-nome (Aluno-instituição aluno2))
             (InstEnsino-nome inst))
   (= (InstEnsino-ano (Aluno-instituição aluno1))
      (InstEnsino-ano inst))
   (= (InstEnsino-ano (Aluno-instituição aluno2))
      (InstEnsino-ano inst))))
;; Testes:
(check-expect (mesmaInstituição? aluno1 aluno2 UFRGS) true)
(check-expect (mesmaInstituição? aluno1 aluno2 PUCRS) false)
(check-expect (mesmaInstituição? aluno1 aluno3 UFRGS) false)

;; ==============================================================================
;; 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3

;; idade: Aluno Aluno InstEnsino -> Número
;; Dados dois alunos e um instituição de ensino, nesta ordem, retorna a idade da
;; instituição em 2020, caso ambos alunos estejam matriculados na instituição.
;; Caso contrário retorna -1.
;; Exemplos:
;; (idade aluno1 aluno2 UFRGS) = 125
;; (idade aluno1 aluno2 PUCRS) = -1
;; (idade aluno1 aluno3 UFRGS) = -1
(define (idade aluno1 aluno2 inst)
  (cond
    [(mesmaInstituição? aluno1 aluno2 inst) (- 2020 (InstEnsino-ano inst))]
    [else -1]))
;; Testes:
(check-expect (idade aluno1 aluno2 UFRGS) 125)
(check-expect (idade aluno1 aluno2 PUCRS) -1)
(check-expect (idade aluno1 aluno3 UFRGS) -1)

;; ==============================================================================
;; 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4

;;                                       a                                       
 
(define-struct moto (ano  modelo valor))
;; Um elemento do conjunto moto tem o formato:
;;     (make-moto a m v)
;; onde:
;; a: numero, representa o ano de fabricação da moto
;; m: string, indica o modelo da moto
;; v: numero, representa o valor de mercado da moto

(define moto1 (make-moto 2014 "Honda CBR-600" 36900))
(define moto2 (make-moto 2009 "Honda CG-150" 5000))
(define moto3 (make-moto 2017 "BMW R1200 GS ADVENTURE" 75000))

(define-struct carro (ano modelo valor ar vidros direção))
;; Um elemento do conjunot carro tem o formato:
;;     (make-carro a m v ar vi di)
;; onde:
;; a: numero, representa o ano de fabricação do carro
;; m: string, representa o modelo do carro
;; v: numero, representa o valor de mercado do carro
;; ar: booleano, indica se o carro tem ou não ar-condicionado
;; vi: booleano, indica se o carro tem vidros elétricos
;; di: indica se o carro tem direção hidráulica

(define carro1 (make-carro 2008 "Honda FIT" 25000 true true true))
(define carro2 (make-carro 2000 "FIAT Palio" 11000 false false false))
(define carro3 (make-carro 2015 "Porscche Panamera" 390000 true true true))

;;                                       b

;; numero-extras: carro -> numero
;; dado um carro, calcula quantos atributos ele tem
;; Exemplos:
;; (numero-extras carro1) = 3
;; (numero-extras carro2) = 3
;; (numero-extras carro3) = 3
(define (numero-extras carro)
 (+
  (if (carro-ar carro) 1 0)
  (if (carro-vidros carro) 1 0)
  (if (carro-direção carro) 1 0)))
;; Testes:
(check-expect (numero-extras carro1) 3)
(check-expect (numero-extras carro2) 0)
(check-expect (numero-extras carro3) 3)

;; cdc(calcula-diária-carro): carro -> numero
;; dado um carro, retorna o valor da diária do aluguel dele
;; Exemplos:
;; (cdc carro1) = 152.5
;; (cdc carro2) = 27.5
;; (cdc carro3) = 1065
(define (cdc carro)
  (+ (* (numero-extras carro) 30)
     (* 1/400 (carro-valor carro))))
;; Testes:
(check-expect (cdc carro1) 152.5)
(check-expect (cdc carro2) 27.5)
(check-expect (cdc carro3) 1065)

;;                                       c

;; cdm(calcula-diária-moto): moto -> numero
;; dada uma moto, retorna o valor da diária do aluguel dela
;; Exemplos:
;; (cdm moto1) = 182.25
;; (cdm moto2) = 82.5
;; (cdm moto3) = 277.5
(define (cdm moto)
  (+ (if (< (moto-ano moto) 2011) 70 90)
     (* 1/400 (moto-valor moto))))
;; Testes:
(check-expect (cdm moto1) 182.25)
(check-expect (cdm moto2) 82.5)
(check-expect (cdm moto3) 277.5)

;; ==============================================================================
;; 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5

(define PI 3.14)

;; constantes para testes:
(define posn1 (make-posn 0 0))
(define posn2 (make-posn 3 4))
(define posn3 (make-posn 6 8))

;; distancia: posn posn ->  numero
;; dados dois pontos calcula a distancia entre eles
;; Exemplos:
;; (distancia posn1 posn2) = 5
;; (distancia posn2 posn3) = 5
;; (distancia posn1 posn3) = 10
(define (distancia posn1 posn2)
  (sqrt
   (+ (sqr (- (posn-x posn2) (posn-x posn1)))
      (sqr (- (posn-y posn2) (posn-y posn1))))))
;; Testes:
(check-expect (distancia posn1 posn2) 5)
(check-expect (distancia posn2 posn3) 5)
(check-expect (distancia posn1 posn3) 10)
 
;; area: posn posn -> numero
;; dados dois elementos de Posn: um representando o centro do círculo
;; e outro representando um ponto em sua circunferência, retorna a área do
;; circulo
;; Exemplos:
;; (area posn1 posn2) = 25PI
;; (area posn2 posn3) = 25PI
;; (area-posn1 posn3) = 100PI
(define (area posn1 posn2)
  (* PI (sqr (distancia posn1 posn2))))
;; Testes:
(check-expect (area posn1 posn2) 78.5)
(check-expect (area posn2 posn3) 78.5)
(check-expect (area posn1 posn3) 314)








  






