;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; Language: Beginning Student

;; a shape is either:
;;   (make-square P S) or
;;   (make circle P S)
;;   (make-rectangle P S S)
;; where P is a posn, S is a number and S2 is a number

(define-struct square (nw-corner length))
(define-struct circle (center radius))
(define-struct rectangle (nw-corner width height))

;; perimeter : shape -> number
;; computes the perimeter of a-shape

#|
;; Template
(define (perimeter a-shape)
  (cond
    [(square? a-shape) ...
     (square-nw-corner a-shape) ...
     (square-length a-shape) ...]
    [(circle? a-shape) ...
     (circle-center a-shape) ...
     (circle-radius a-shape) ...]
    [(rectangle? a-shape) ...
     (rectangle-nw-corner a-shape) ...
     (rectangle-width a-shape) ...
     (rectangle-height a-shape)]))
|#

(define (perimeter a-shape)
  (cond
    [(square? a-shape)
     (* 4
        (square-length a-shape))]
    [(circle? a-shape) 
     (* pi
        2
        (circle-radius a-shape))]
    [(rectangle? a-shape) 
     (* 2
        (+ (rectangle-width a-shape)
           (rectangle-height a-shape)))]))

;; EXAMPLES AS TESTS
(perimeter (make-square (make-posn 10 10) 5)) "should be" 20
(perimeter (make-circle (make-posn 10 10) 3)) "should be" (* 6 pi)
(perimeter (make-rectangle (make-posn 10 10) 2 4)) "should be" 12