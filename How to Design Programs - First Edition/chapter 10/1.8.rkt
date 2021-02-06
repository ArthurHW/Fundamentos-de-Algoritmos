;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.8|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define (quadratic-roots a b c)
  (cond
    [(= a 0) 'degenerate]
    [(< (* b b)
        (* 4 a c))
     'none]
    [(= (* b b)
        (* 4 a c))
     (/ (- b) (* 2 a))]
    [(> (* b b)
        (* 4 a c))
     (list (/ (+ (- b) 
                 (sqrt (- (* b b) (* 4 a c))))
              (* 2 a))
           (/ (- (- b) 
                 (sqrt (- (* b b) (* 4 a c))))
              (* 2 a)))]))

;; EXAMPLES AS TESTS
(quadratic-roots 1 2 1) "should be" -1
(quadratic-roots 3 4 1) "should be" (list -1/3 -1)
(quadratic-roots 2 4 3) "should be" 'none
(quadratic-roots 1 0 -1) "should be" (list 1 -1)
(quadratic-roots 2 4 2) "should be" -1
(quadratic-roots 0 1 1) "should be" 'degenerate