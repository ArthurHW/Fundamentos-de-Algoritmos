;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; hours->wages : list-of-numbers -> list-of-numbers
;; to create a list of weekly wages from a list of weekly hours (alon) 
(define (hours->wages alon) 
  (cond 
    [(empty? alon) empty] 
    [else
     (cond
       [(> (first alon) 100) (error 'hours->wages "too many hours")]
       [else (cons (wage (first alon)) (hours->wages (rest alon)))])]))

;; wage : number -> number 
;; to compute the total wage (at $12 per hour) 
;; of someone who worked for h hours 
(define (wage h) 
  (* 12 h)) 

;; TESTS
(hours->wages empty) "should be" empty
(hours->wages (cons 10 empty)) "should be" (cons 120 empty)
(hours->wages (cons 101 empty)) "should be" error!
