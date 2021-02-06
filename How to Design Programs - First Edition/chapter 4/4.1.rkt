;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; interest : number -> number
;; calculates the amount of interest for d dollars.

;; EXAMPLES
;; the interest for $500 is $20
;; the interest for $2000 is $90
;; the interest for $10,000 is $500

(define (interest d)
  (cond
    [(<= d 1000) (* d 4/100)]
    [(<= d 5000) (* d 45/1000)]
    [(> d 5000) (* d 5/100)]))

;; EXAMPLES TURNED INTO TESTS
(check-expect (interest 500) 20)
(check-expect (interest 2000) 90)
(check-expect (interest 10000) 500)