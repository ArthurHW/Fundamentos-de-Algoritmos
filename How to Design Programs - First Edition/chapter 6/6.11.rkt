;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6.11|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; teachpack: draw.ss

;; A rectangle is a structure:
;;   (make-rectangle P W H)
;; where P is a posn, W is a number and H is a number.
(define-struct rectangle (nw-corner width height color))

;; DATA EXAMPLES
(define example-rectangle1 (make-rectangle (make-posn 20 20) 260 260 'red))
(define example-rectangle2 (make-rectangle (make-posn 60 60) 180 180 'blue))

#|
;; Template
(define (fun-for-rectangle a-rectangle)
  ... (rectangle-nw-corner a-rectangle) ...
  ... (rectangle-width a-rectangle) ...
  ... (rectangle-height a-rectangle) ...
  ... (rectangle-color a-rectangle) ...)
|#

; -------------------------------------------------------------------------

;; draw-a-rectangle : rectangle -> true
;; to draw a-rect
(define (draw-a-rectangle a-rectangle)
  (draw-solid-rect
   (rectangle-nw-corner a-rectangle)
   (rectangle-width a-rectangle)
   (rectangle-height a-rectangle)
   (rectangle-color a-rectangle)))

;; EXAMPLES
(start 300 300)
(draw-a-rectangle example-rectangle1)
(draw-a-rectangle example-rectangle2)

; -------------------------------------------------------------------------

;; in-rectangle? : rectangle posn -> boolean
;; to determine if a-posn is in a-rectangle, or not
(define (in-rectangle? a-rectangle a-posn)
  (and (<= (posn-x (rectangle-nw-corner a-rectangle))
           (posn-x a-posn)
           (+ (posn-x (rectangle-nw-corner a-rectangle))
              (rectangle-width a-rectangle)))
       (<= (posn-y (rectangle-nw-corner a-rectangle))
           (posn-y a-posn)
           (+ (posn-y (rectangle-nw-corner a-rectangle))
              (rectangle-height a-rectangle)))))

;; EXAMPLES AS TESTS
(in-rectangle? example-rectangle1 (make-posn 0 0)) "should be" false
(in-rectangle? example-rectangle1 (make-posn 25 0)) "should be" false
(in-rectangle? example-rectangle1 (make-posn 0 25)) "should be" false
(in-rectangle? example-rectangle1 (make-posn 25 25)) "should be" true

; -------------------------------------------------------------------------

;; translate-rectangle : rectangle number -> rectangle
;; to translate a-rectangle horizontally by x pixels 
(define (translate-rectangle a-rectangle x)
  (make-rectangle (make-posn
                   (+ x (posn-x (rectangle-nw-corner a-rectangle)))
                   (posn-y (rectangle-nw-corner a-rectangle)))
                  (rectangle-width a-rectangle)
                  (rectangle-height a-rectangle)
                  (rectangle-color a-rectangle)))

;; EXAMPLES AS TESTS
(translate-rectangle example-rectangle1 30)
"should be"
(make-rectangle (make-posn 50 20) 260 260 'red)

; -------------------------------------------------------------------------

;; clear-a-rectangle : rectangle -> true
;; to erase a rectangle
(define (clear-a-rectangle a-rectangle)
  (clear-solid-rect 
   (rectangle-nw-corner a-rectangle)
   (rectangle-width a-rectangle)
   (rectangle-height a-rectangle)))

;; EXAMPLES
(start 300 300)
(draw-a-rectangle example-rectangle1)
(draw-a-rectangle example-rectangle2)
(clear-a-rectangle example-rectangle1)
(clear-a-rectangle example-rectangle2)