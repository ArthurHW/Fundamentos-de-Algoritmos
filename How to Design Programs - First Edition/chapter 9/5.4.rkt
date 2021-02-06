;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; Language: Beginning Student

;; check-range1? : list-of-numbers -> boolean
;; determines if the list of numbers is between 5 and 95

#|
;; Template 
(define (check-range1? a-lon)
  (cond
    [(empty? a-lon) ...]
    [else ... (first a-lon) ...
          ... (check-range1? (rest a-lon)) ...]))
|#

(define (check-range1? a-lon)
  (cond
    [(empty? a-lon) true]
    [else (and (<= 5 (first a-lon) 95)
               (check-range1? (rest a-lon)))]))

;; Examples:

(check-expect (check-range1? empty) true)
(check-expect (check-range1? (cons 50 empty)) true)
(check-expect (check-range1? (cons 101 empty)) false)
(check-expect (check-range1? (cons 45 (cons 52 (cons 23 (cons 44 (cons 96 (cons 22 empty))))))) false)

;; check-range? : list-of-numbers number number -> boolean
;; checks to make sure all of the numbers on a-lon are between n1 and n2

#|
;; Template
(define (check-range? a-lon n1 n2)
  (cond
    [(empty? a-lon) ...]
    [else ... (first a-lon) ...
          ... (check-range (rest a-lon) n1 n2) ...]))

|#

(define (check-range? a-lon n1 n2)
  (cond
    [(empty? a-lon) true]
    [else (and (<= n1 (first a-lon) n2)
               (check-range? (rest a-lon) n1 n2))]))

(check-expect (check-range? empty 1 2) true)
(check-expect (check-range? (cons 5 empty) 3 7) true)
(check-expect (check-range? (cons 100 empty) 3 7) false)
(check-expect (check-range? (cons 1 (cons 3 (cons 54 (cons 12312 empty)))) 0 1000000000) true)
(check-expect (check-range? (cons 1 (cons 1000000000 (cons -1000000000 empty))) -1 1) false)