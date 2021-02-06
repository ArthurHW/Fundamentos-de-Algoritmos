;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex_projeto_de_algoritmos_teatro) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;;lucro: Numero -> Numero
;; obj: Dado o preço do ingresso, calcular o lucro do espetáculo
;;Exemplos:
(check-expect (lucro 5) 420)
(define (lucro preço-do-ingresso)
              (-
               (receita preço-do-ingresso)
               (custo preço-do-ingresso)
               )
              )
  
;;nro-espectadores: Numero -> Numero
;; Obj: Dado o preço do ingressoo, calculcar o
;;      número de espectadores
;; Exemplos:
(check-expect (nro-espectadores 5) 120)
(check-expect (nro-espectadores 4.9) 140)
(define (nro-espectadores preço)
  (+ 120
     (* 200
        (- 5 preço)
        )
     )
  )

;;receita: Numero -> Numero
;; obj: Dado o preço do ingresso, calcular a receita do espetáculo
;;Exemplos:
(check-expect (receita 5) 600)
(define (receita preço)
  (*
   (nro-espectadores preço)
   preço
   )
  )

;;custo: Numero -> Numero
;;obj: Dado o preço do ingresso, calcular o custo do espetáculo
;;Exemplos:
(check-expect (custo 5) 180)
(define (custo preço)
     (* 1.5
        (nro-espectadores preço)
        )
  )

(lucro 5)
(lucro 4.9)
(lucro 5.1)
(lucro 6)



