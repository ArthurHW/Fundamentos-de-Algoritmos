;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; In order to give everyone a raise to $14, we only need to change 
;; the 12 to a 14. (and fix the description of the function)
;; Here is the changed program and some examples:

;; hours->wages : list-of-numbers -> list-of-numbers
;; to create a list of weekly wages from
;; a list of weekly hours (alon)
(define (hours->wages alon)
  (cond
    [(empty? alon) empty]
    [else (cons (wage (first alon))
                (hours->wages (rest alon)))]))

;; wage : number -> number
;; to compute the total wage (at $14 per hours)
(define (wage h)
  (* 14 h))

(hours->wages empty) "should be" empty
(hours->wages (cons 2 empty)) "should be" (cons 28 empty)
(hours->wages (cons 2 (cons 14 (cons 211 empty)))) "should be"
(cons 28 (cons 196 (cons 2954 empty)))