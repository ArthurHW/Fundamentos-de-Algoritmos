;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex22_calcula_multa) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; calcula-multa: Número Núme.ro -> Número
;; dadas a velocidade máxima de uma via, a velocidade inferida pelo sensor
;; calcula o valor multa  do condutor
;; Exemplos:
;; (calcula-multa 80 70) = 0
;; (calcula-multa 80 90) = 105.6
;; (calcula-multa 80 100) = 139.2
;; (calcula-multa 80 110) = 216
;; (calcula-multa 80 230) = 300
(define (calcula-multa vmax vinf)
  (cond
    [(<= (- vinf vmax) 0) 0]
    [(<= (- vinf vmax) 15) 105.6]
    [(<= (- vinf vmax) 25) 139.2]
    [(<= (- vinf vmax) 40) 216]
    [else 300]))
;; Testes:
(check-expect (calcula-multa 80 70) 0)
(check-expect (calcula-multa 80 90) 105.6)
(check-expect (calcula-multa 80 100) 139.2)
(check-expect (calcula-multa 80 110) 216)
(check-expect (calcula-multa 80 230) 300)