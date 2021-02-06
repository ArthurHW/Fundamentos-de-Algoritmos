;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cap7) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define PI 3.14)

(define-struct cubo (lado))

;; Um elemento do conjunto cubo é uma estrutura e tem a forma:
;; (make-cubo lado) onde:
;; lado: Número, representa o tamanho do lado do cubo

(define-struct prisma (altura largura profundidade))

;; Um elemento do conjunto prisma é uma estrutura e tem a forma:
;; (make-prisma alutar largura profundidade) onde
;; altura: Número é a altura do prisma
;; largura: Número é a largura do prisma
;; profundidade: Número, representa a profundidade do prisma

(define-struct esfera (raio))
;; Um elemento do conjunto esrututa e tem a forma:
;; (make-esfera raio) onde:
;; raio: Número, representa o tamanho do raio da esfera

;; Um elemento do conjunto Forma3D pode ser
;; 1) Um elemento de Cubo ou
;; 2) Um elemento de Prisma ou
;; 3) um elemento de Esfera

;; volume: Forma3D -> Número
;; Calcula o volume de uma forma tridimensional
(define (volume uma-forma)
  (cond
    [(cubo? uma-forma) (expt (cubo-lado uma-forma) 3)]
    [(prisma? uma-forma)
     (* (prisma-largura uma-forma)
        (prisma-profundidade uma-forma)
        (prisma-altura uma-forma))]
    [(esfera? uma-forma)
     (* (/ 4 3) PI
        (expt (esfera-raio uma-forma) 3))]))

;; mesma-forma? : Forma Forma -> Boolean
;; Identifica formas iguais que possuem as
;; mesmas dimensões
(define (mesma-forma? forma1 forma2)
  (cond
    [(and (cubo? forma1) (cubo? forma2))
     (= (cubo-lado forma1) (cubo-lado forma2))]
    
    [(and (prisma? forma1) (prisma? forma2))
     (and (= (prisma-largura forma1)
             (prisma-largura forma2))
          (= (prisma-profundidade forma1)
             (prisma-profundidade forma2))
          (= (prisma-altura forma1)
             (prisma-altura forma2)))]
    
    [(and (esfera? forma1) (esfera? forma2))
     (= (esfera-raio forma1) (esfera-raio forma2))]
    [else false]))

;; mesma-forma? : Forma Forma -> Boolean
;; Identifica formas iguais que possuem as
;; mesmas dimensões
(define (mesma-forma? forma1 forma2)
  (or
   (and ; se as 3 condições abaixo forem true, retorna true
    (cubo? forma1) (cubo? forma2) (= (cubo-lado forma1)(cubo-lado forma2)))
   ; senão testa para prisma:
   (and (prisma? forma1) (prisma? forma2)
        (= (prisma-largura forma1) (prisma-largura forma2) )
        (= (prisma-profundidade forma1) (prisma-profundidade forma2))
        (= (prisma-altura forma1) (prisma-altura forma2)))
   ; e por fim, para esfera
   (and (esfera? forma1) (esfera? forma2)
        (= (esfera-raio forma1) (esfera-raio forma2))))
  ; se nenhuma das 3 for true, false será a resposta
  )





