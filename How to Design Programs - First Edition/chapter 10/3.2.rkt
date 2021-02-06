;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.2|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
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

;; draw-shape : shape -> true
;; draws a-shape
(define (draw-shape a-shape)
  (cond
    [(circle? a-shape) 
     (draw-circle
      (circle-center a-shape)
      (circle-radius a-shape)
      (circle-color a-shape))]
    [(rectangle? a-shape)
     (draw-solid-rect 
      (rectangle-nw-corner a-shape)
      (rectangle-width a-shape)
      (rectangle-height a-shape)
      (rectangle-color a-shape))]))

;; EXAMPLES AS TESTS
(start 200 200)
(draw-shape (make-circle 'red (make-posn 30 30) 20)) "should be" true
(draw-shape (make-rectangle 'blue (make-posn 30 60) 20 50)) "should be" true

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

; -------------------------------------------------------------------------

;; draw-losh : list-of-shapes -> true
;; draws each shape on a-los
(define (draw-losh a-los)
  (cond
    [(empty? a-los) true]
    [else (and (draw-shape (first a-los))
               (draw-losh (rest a-los)))]))

;; EXAMPLES AS TESTS
(start 100 100)
(draw-losh empty) "should be" true