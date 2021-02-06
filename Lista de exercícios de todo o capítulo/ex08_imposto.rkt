;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex08_imposto) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;8) função imposto que consome um salário bruto e produz a quantia de imposto devida
;sendo: Para um salário bruto de R$240 ou menos, o imposto é de 0%. Para salários entre
;R$240 e R$480, o imposto é de 15%. Acima de R$480, o imposto devido é de 28%.
(define (imposto salario)
  (if
   (<= salario 240)
   0
   (if
    (<= salario 480)
    (* salario 15/100)
    (* salario 28/100))))
