;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex06_juro) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;6) Desenvolver a função juro que calcula a quantia de juro a ser paga dependo do montante
;que será depositado,sendo o juro de 4% para depósitos ate $1000, 4,5% para depósitos até
;$5000 e 5% para depósitos acima de $5000
(define (juro valor)
  (if (<= valor 1000)
      (* valor 4/100)
      (if
       (<= valor 5000)
       (* valor (/ 4.5 100))
       (* valor 5/100)))) 