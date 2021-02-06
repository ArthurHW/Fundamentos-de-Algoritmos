;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; dollar-store? : list-of-numbers -> boolean
;; determines if all of the prices in a-lon are less than 1.00
#|
;; Template
(define (dollar-store? a-lon)
  (cond
   [(empty? a-lon) ...]
   [else ... (first a-lon) ...
         ... (dollar-store? (rest a-lon)) ...]))
|#

(define (dollar-store? a-lon)
  (cond
   [(empty? a-lon) true]
   [else (and (<= (first a-lon) 1.00)
              (dollar-store? (rest a-lon)))]))

;; Examples:

(dollar-store? empty) "should be" true
(dollar-store? (cons .75 (cons 1.95 (cons .25 empty)))) "should be" false
(dollar-store? (cons .75 (cons 0.95 (cons .25 empty)))) "should be" true


;; N-dollar-store? : list-of-numbers number -> boolean
;; Determines if all of the prices on a-lon are less than an-n
#|
;; Template

(define (N-dollar-store? a-lon an-n)
  (cond
    [(empty? a-lon) ...]
    [else ... (first a-lon)
          ... (N-dollar-store? (rest a-lon) an-n) ...]))
|#

(define (N-dollar-store? a-lon an-n)
  (cond
    [(empty? a-lon) true]
    [else (and (<= (first a-lon) an-n)
               (N-dollar-store? (rest a-lon) an-n))]))

;; Examples:

(N-dollar-store? empty 1.00) "should be" true
(N-dollar-store? (cons 1.50 empty) 2.00) "should be" true
(N-dollar-store? (cons 3.00 empty) 2.00) "should be" false
(N-dollar-store? (cons .75 (cons 1.95 (cons .25 empty))) 1.50) "should be" false
(N-dollar-store? (cons .75 (cons 0.95 (cons .25 empty))) 1.50) "should be" true