;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.8|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; draw-shapes : posn list-of-numbers -> true
;; draws circles centered at a-posn with radii taken from a-lon

#|
;; Template
(define (draw-shapes a-posn a-lon)
  (cond
    [(empty? a-lon) ...]
    [else ... (first a-lon) ...
          ... (draw-shapes a-posn (rest a-lon)) ...]))
|#

(define (draw-shapes a-posn a-lon)
  (cond
    [(empty? a-lon) true]
    [else (and (draw-circle a-posn (first a-lon))
               (draw-shapes a-posn (rest a-lon)))]))

;; Examples:
(start 300 300)
(draw-shapes (make-posn 10 10) empty)
(draw-shapes (make-posn 10 10) (cons 5 empty))
(draw-shapes (make-posn 150 150)
             (cons 20
                   (cons 40
                         (cons 60
                               (cons 80
                                     (cons 100
                                           (cons 120
                                                 (cons 140
                                                       empty))))))))