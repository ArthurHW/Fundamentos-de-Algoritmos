;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex17_calculadora) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; calculadora: string numero numero -> numero
;; dado uma string indicando a opreação que será realizada (adição, subtração,
;; divisão ou multiplicação) retorna o resultado da operação
;; Exemplos:
;; (calculadora "+" 2 2) = 4
;; (calculadora "-" 2 2) = 4
;; (calculadora "/" 2 2) = 1
;; (calculadora "*" 2 2) = 4
(define (calculadora operador n1 n2)
  (cond
    [(string=? "+" operador) (+ n1 n2)]
     [(string=? "-" operador) (- n1 n2)]
      [(string=? "*" operador) (* n1 n2)]
       [(string=? "/" operador) (if (= n2 0) "operação inválida: divisão por 0" (/ n1 n2))]
       [else "operador inválido"]))
;; Testes:
(check-expect (calculadora "+" 2 2) 4)
(check-expect (calculadora "-" 2 2) 0)
(check-expect (calculadora "*" 2 2) 4)
(check-expect (calculadora "/" 2 2) 1)

       
       