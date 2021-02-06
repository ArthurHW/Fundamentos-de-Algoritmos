;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; equation1 : number -> boolean
;; determines if n satisfies equation #1
(define (equation1 n)
  (= (+ (* 4 n) 2)
     62))

;; equation2 : number -> boolean
;; determines if n satisfies equation #2
(define (equation2 n)
  (= (* 2 (* n n))
     102))

;; equation3 : number -> boolean
;; determines if n satisfies equation #3
(define (equation3 n)
  (= (+ (* 4 (* n n)) (* 6 n) 2)
     462))

(check-expect (equation1 10) #false)
(check-expect (equation1 12) #false)
(check-expect (equation1 14) #false)
(check-expect (equation2 10) #false)
(check-expect (equation2 12) #false)
(check-expect (equation2 14) #false)
(check-expect (equation3 10) #true)
(check-expect (equation3 12) #false)
(check-expect (equation3 14) #false)