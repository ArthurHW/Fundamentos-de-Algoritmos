;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |7.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; draw-next-part : symbol -> true
;; consumes one of the seven body-part symbols and draws that part.

#|
;; TEMPLATE
(define (draw-next-part body-part)
  (cond
    [(eq? body-part 'body) ...]
    [(eq? body-part 'right-leg) ...]
    [(eq? body-part 'left-leg) ...]
    [(eq? body-part 'right-arm) ...]
    [(eq? body-part 'left-arm) ...]
    [(eq? body-part 'head) ...]
    [(eq? body-part 'noose) ...]))
|#

(define (draw-next-part body-part)
  (cond 
    [(eq? body-part 'body)
     (draw-solid-line (make-posn 100 60)
                      (make-posn 100 130)
                      'black)]
    [(eq? body-part 'right-leg)
     (draw-solid-line (make-posn 100 130)
                      (make-posn 30 170)
                      'black)]
    [(eq? body-part 'left-leg)
     (draw-solid-line (make-posn 100 130)
                      (make-posn 170 170)
                      'black)]
    [(eq? body-part 'right-arm)
     (draw-solid-line (make-posn 100 75)
                      (make-posn 40 65)
                      'black)]
    [(eq? body-part 'left-arm)
     (draw-solid-line (make-posn 100 75)
                      (make-posn 160 65)
                      'black)]
    [(eq? body-part 'head)
     (and       
      (draw-solid-disk (make-posn 120 50) 30 'red)
      (draw-solid-line (make-posn 115 35)
                       (make-posn 123 43)
                       'black)
      (draw-solid-line (make-posn 123 35)
                       (make-posn 115 43)
                       'black)
      (draw-solid-line (make-posn 131 40)
                       (make-posn 139 48)
                       'black)
      (draw-solid-line (make-posn 139 40)
                       (make-posn 131 48)
                       'black))]
    [(eq? body-part 'noose)
     (and
      (draw-solid-line (make-posn 100 30)
                       (make-posn 100 10)
                       'black)
      (draw-solid-line (make-posn 100 10)
                       (make-posn 0 10)
                       'black))]))

;; TESTS

(start 200 200)
(draw-next-part 'noose)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'right-arm)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'right-arm)
(draw-next-part 'left-arm)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'right-arm)
(draw-next-part 'left-arm)
(draw-next-part 'right-leg)


(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'right-arm)
(draw-next-part 'left-arm)
(draw-next-part 'right-leg)
(draw-next-part 'left-leg)