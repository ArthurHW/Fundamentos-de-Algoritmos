;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.6|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; delta : list-of-numbers list-of-numbers -> number
;; calculates the change in value of two lists of prices

#|

The template for this function does not help with the design
of this function! Instead, it is better to define an auxiliary
program sum and use that to compute the difference in the
price lists.

|#

(define (delta a-lon another-lon)
  (- (sum a-lon) (sum another-lon)))

;; sum : list-of-numbers -> number
;; calculates the sum of the numbers in the list

#|
;; Template
(define (sum a-lon)
  (cond
    [(empty a-lon) ...]
    [else ... (first a-lon) ...
          ... (sum (rest a-lon)) ...]))
|#

(define (sum a-lon)
  (cond
    [(empty? a-lon) 0]
    [else (+ (first a-lon)
             (sum (rest a-lon)))]))

;; examples:

(sum empty) "should be" 0
(sum (cons 1 empty)) "should be" 1
(sum (cons 2 (cons 4 (cons 537 empty)))) "should be" 543

(delta empty empty) "should be" 0
(delta (cons 1 empty) empty) "should be" 1
(delta empty (cons 1 empty)) "should be" -1
(delta (cons 1 empty) (cons 1 empty)) "should be" 0
(delta (cons 2 (cons 4 (cons 537 empty)))
       (cons 2 (cons 5 (cons 212 empty))))
"should be"
324