;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; A list-of-three-numbers is:
;;   (cons x (cons y (cons z empty)))
;; where x, y and z are numbers.

;; examples:
(cons 1 (cons 1 (cons 1 empty)))
(cons -1 (cons 2 (cons -1 empty)))

;; add-up-3 : list-of-3-numbers -> number
;; adds up the three numbers in the list-of-3-numbers.

#|
;; Template
(define (add-up-3 a-lo3n)
  (first a-lo3n)
  (first (rest a-lo3n))
  (first (rest (rest a-lo3n))))
|#

(define (add-up-3 a-lo3n)
  (+ (first a-lo3n)
     (first (rest a-lo3n))
     (first (rest (rest a-lo3n)))))

(add-up-3 (cons 1 (cons 1 (cons 1 empty)))) "should be" 3
(add-up-3 (cons -1 (cons 2 (cons -1 empty)))) "should be" 0

;; distance-to-0-for-3 : list-of-3-numbers -> number
;; finds the distance to the origin, treating a
;; list-of-3-numbers as a coordinate in space.

#|
;; Template
(define (distance-to-0-for-3 a-lo3n)
  (first a-lo3n)
  (first (rest a-lo3n))
  (first (rest (rest a-lo3n))))
|#

(define (distance-to-0-for-3 a-lo3n)
  (sqrt (+ (sqr (first a-lo3n))
           (sqr (first (rest a-lo3n)))
           (sqr (first (rest (rest a-lo3n)))))))

;; Examples:
(distance-to-0-for-3 (cons 1 (cons 1 (cons 1 empty)))) "should be" (sqrt 3)
(distance-to-0-for-3 (cons -1 (cons 2 (cons -1 empty)))) "should be" (sqrt 6)