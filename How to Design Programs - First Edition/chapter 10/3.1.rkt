;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; a shape is either:
;;   - (make-circle C P N)
;;   - (make-rectangle C P N N)
;; where C is a color,
;;       P is a posn, and
;;       N is a number.

(define-struct circle (color center radius))
(define-struct rectangle (color nw-corner width height))

#|
;; TEMPLATE
(define (prog-for-shape a-shape)
  (cond
    [(circle? a-shape) 
     (circle-color a-shape) ...
     (circle-center a-shape) ...
     (circle-radius a-shape) ...]
    [(rectangle? a-shape)
     (rectangle-color a-shape) ...
     (rectangle-nw-corner a-shape) ...
     (rectangle-width a-shape) ...
     (rectangle-height a-shape) ...]))
|#

; -------------------------------------------------------------------------

;; A list-of-shapes is either:
;;  - empty, or
;;  - (cons shape list-of-shapes)

#|
;; TEMPLATE
(define (prog-for-losh a-los)
  (cond
    [(empty? a-los) ...]
    [else (first a-los) ...
          (prog-for-losh (rest a-los))..]))
|#

(define FACE
  (cons (make-circle 'red (make-posn 50 50) 50)
        (cons (make-rectangle 'blue (make-posn 30 20) 10 10)
              (cons (make-rectangle 'blue (make-posn 65 20) 10 10)
                    (cons (make-rectangle 'blue (make-posn 40 75) 10 10)
                          (cons (make-rectangle 'blue (make-posn 40 75) 25 10)
                                (cons (make-rectangle 'blue (make-posn 45 35) 15 30)
                                      empty)))))))