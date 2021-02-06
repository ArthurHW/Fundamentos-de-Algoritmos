;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp")) #f)))
;; distance-to-0 : posn -> number
(define (distance-to-0 a-posn)
  (sqrt (+ (sqr (posn-x a-posn))
           (sqr (posn-y a-posn)))))

;; 1.
(distance-to-0 (make-posn 3 4)) "should be"
(sqrt (+ (sqr (posn-x (make-posn 3 4)))
         (sqr (posn-y (make-posn 3 4))))) "should be"
(sqrt (+ (sqr 3)
         (sqr (posn-y (make-posn 3 4))))) "should be" 
(sqrt (+ (sqr 3)
         (sqr 4))) "should be" 
(sqrt (+ 9 16)) "should be"
(sqrt 25) "should be"
5

;; 2.
(distance-to-0 (make-posn (* 2 3) (* 2 4))) "should be"
(distance-to-0 (make-posn 6 8)) "should be"
(sqrt (+ (sqr (posn-x (make-posn 6 8)))
         (sqr (posn-y (make-posn 6 8))))) "should be"
(sqrt (+ (sqr 6)
         (sqr (posn-y (make-posn 6 8))))) "should be"
(sqrt (+ (sqr 6)
         (sqr 8))) "should be"
(sqrt (+ 36
         (sqr 8))) "should be"
(sqrt (+ 36 64)) "should be"
(sqrt 100) "should be"
10

;; 3.
(distance-to-0 (make-posn 12 (- 6 1))) "should be"
(distance-to-0 (make-posn 12 5)) "should be"
(sqrt (+ (sqr (posn-x (make-posn 12 5)))
         (sqr (posn-y (make-posn 12 5))))) "should be"
(sqrt (+ (sqr 12)
         (sqr (posn-y (make-posn 12 5))))) "should be"
(sqrt (+ (sqr 12)
         (sqr 5))) "should be"
(sqrt (+ 144 (sqr 5))) "should be"
(sqrt (+ 144 25)) "should be"
(sqrt 169) "should be"
13