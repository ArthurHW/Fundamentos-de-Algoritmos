;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; a shape is either:
;;   (make-square P S) or
;;   (make circle P S)
;; where P is a posn and S is a number.

(define-struct square (nw-corner length))
(define-struct circle (center radius))

;; area : shape -> number
;; computes the area of a-shape

#|
;; Template
(define (area a-shape)
  (cond
    [(square? a-shape) ...
     (square-nw-corner a-shape) ...
     (square-length a-shape) ...]
    [(circle? a-shape) ...
     (circle-center a-shape) ...
     (circle-radius a-shape) ...]))
|#

(define (area a-shape)
  (cond
    [(square? a-shape)
     (* (square-length a-shape)
        (square-length a-shape))]
    [(circle? a-shape) 
     (* pi
        (circle-radius a-shape)
        (circle-radius a-shape))]))

;; EXAMPLES AS TESTS
(area (make-square (make-posn 10 10) 4)) "should be" 16
(area (make-circle (make-posn 10 10) 2)) "should be" (* 4 pi)

;; Yes, it is possible to re-use the template for perimeter, after changing its name.
;; This works becuase the consume the same data, and the template 
;; for a function is only based on the input data for that function.