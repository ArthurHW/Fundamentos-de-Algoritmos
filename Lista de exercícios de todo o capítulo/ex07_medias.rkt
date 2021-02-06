;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex07_medias) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;7) Função médias que consome 4 números, o primeiro determina o tipo de média dos outros 3,
;sendo o dígito 1 responsável pela média aritmética e o 2 pela média harmônica
(define (media-harmonica x1 x2 x3)
  (/ 3 (+ (/ 1 x1) (/ 1 x2) (/ 1 x3))))
(define (media-aritmetica x1 x2 x3)
  (/ (+ x1 x2 x3) 3))
(define (médias tipo x1 x2 x3)
  (if
   (= tipo 1)
   (media-aritmetica x1 x2 x3)
   (if
    (= tipo 2)
    (media-harmonica x1 x2 x3)
    0)))
                  
