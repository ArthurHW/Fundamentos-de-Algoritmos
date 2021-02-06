;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex03_altura_foguete) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;3) programa que calcula a altura que um foguete atinge dado um certo tempo (t) e uma certa
;aceleração (g), onde v = g * t e altura = 1/2 * v * t
(define (velocidade t g)
  (* g t))
(define (altura t g)
  (* 1/2 (velocidade t g) t))
