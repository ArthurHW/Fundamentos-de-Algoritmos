;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; convert-euro : list-of-numbers -> list-of-numbers
;; converts a list of dollar amounts into a list
;; of Euro amounts

#|
;; Template
(define (convert-euro a-lon)
  (cond
    [(empty? a-lon) ...]
    [else ... (first a-lon) ...
          ... (convert-euro (rest a-lon)) ...]))
|#

(define (convert-euro a-lon)
  (cond
    [(empty? a-lon) empty]
    [else (cons (euro->$ (first a-lon))
                (convert-euro (rest a-lon)))]))

;; euro->$ : number -> number
;; converts a Euro amount to a dollar amount
(define (euro->$ dm)
  (* dm 1.82))

;; convert-euro1 : number list-of-numbers -> list-of-numbers
;; converts a list of dollar amounts into a list
;; of Euro amounts with exchange rate named rate

#|
;; Template
(define (convert-euro-1 rate a-lon)
  (cond
    [(empty? a-lon) ...]
    [else ... (first a-lon) ...
          ... (convert-euro-1 rate (rest a-lon)) ...]))
|#

(define (convert-euro-1 rate a-lon)
  (cond
    [(empty? a-lon) empty]
    [else (cons (euro->$-rate rate (first a-lon))
                (convert-euro-1 rate (rest a-lon)))]))

;; euro->$-rate : number -> number
;; converts a Euro amount to a dollar amount
;; with exchange rate, `rate'
(define (euro->$-rate rate dm)
  (* dm rate))

;; EXAMPLES AS TESTS

(euro->$ 1) "should be" 1.82
(euro->$ 0) "should be" 0

(convert-euro empty) "should be" empty
(convert-euro (cons 0.50 empty)) "should be" (cons 0.91 empty)

(euro->$-rate 1 1.82) "should be" 1.82
(euro->$-rate 0 1.82) "should be" 0
(euro->$-rate 1 1.87) "should be" 1.87
(euro->$-rate 2 1.76) "should be" 3.52

(convert-euro-1 1.82 empty) "should be" empty
(convert-euro-1 1.76 (cons 0.50 empty)) "should be" (cons 0.88 empty)