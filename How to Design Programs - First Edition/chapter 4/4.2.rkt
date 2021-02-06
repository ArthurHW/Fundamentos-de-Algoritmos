;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; tax : number -> number
;; to deteremine the amount of tax owed, for a given gross-pay
(define (tax gross-pay)
  (cond
    [(<= gross-pay 240) 0]
    [(<= gross-pay 480) (* gross-pay .15)]
    [else (* gross-pay .28)]))

;; EXAMPLES AS TESTS
(check-expect (tax 10) 0)
(check-expect (tax 240) 0)
(check-expect (tax 300) 45)
(check-expect (tax 480) 72)
(check-expect (tax 500) 140)

;; netpay : number -> number
;; to determine the amount of income, after taxes.
(define (netpay hours-worked)
  (- (* hours-worked 12) 
     (tax (* hours-worked 12))))

;; EXAMPLES AS TESTS
(check-expect (netpay 1) 12)
(check-expect (netpay 40) 408)