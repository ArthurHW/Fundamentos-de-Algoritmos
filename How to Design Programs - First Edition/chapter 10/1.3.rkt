;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; convertFC : list-of-numbers -> list-of-numbers
;; converts a list of fahrenheit temperatures into a list
;; of celsius temperatures

#|
;; Template
(define (convertFC a-lon)
  (cond
    [(empty? a-lon) ...]
    [else ... (first a-lon) ...
          ... (convertFC (rest a-lon)) ...]))
|#

(define (convertFC a-lon)
  (cond
    [(empty? a-lon) empty]
    [else (cons (fahrenheit->celsuis (first a-lon)) 
                (convertFC (rest a-lon)))]))

;; faherenheit->celsuis : number -> number
;; converts a temperature in fahrenheit to a temperature in celsuis.
(define (fahrenheit->celsuis f)
  (* 5/9 (- f 32)))

;; Examples:
(fahrenheit->celsuis 32) "should be" 0
(fahrenheit->celsuis 212) "should be" 100

(convertFC empty) "should be" empty
(convertFC (cons 32 (cons 212 (cons 86 empty)))) "should be" 
(cons 0 (cons 100 (cons 30 empty)))