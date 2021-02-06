;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.7|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; average-price : list-of-numbers -> number
;; calculates the average price on a-lon

#|
;; Template
(define (average-price a-lon)
  (cond
    [(empty? a-lon) ...]
    [else ... (first a-lon) ...
          ... (average-price (rest a-lon)) ...]))

|#

;; Now we are stuck. We followed the recipe blindly. Let's step back and
;; see how we computed the average for the examples. We summed up the
;; numbers AND we counted the numbers AND we divided the first by the
;; second. Aha -- we no longer have the option of choosing auxiliaries; we
;; must do so to write simple programs.

(define (average-price a-lon)
  (/ (sum a-lon) 
     (count a-lon)))

;; sum : list-of-numbers -> number
;; calcuates the sum of the numbers on a-lon
#|
;; Template
(define (sum a-lon)
  (cond
    [(empty? a-lon) ...]
    [else ... (first a-lon) ...
          ... (sum (rest a-lon)) ...]))

|#

(define (sum a-lon)
  (cond
    [(empty? a-lon) 0]
    [else (+ (first a-lon)
             (sum (rest a-lon)))]))

;; count : list-of-numbers -> number
;; counts the number of numbers on a-lon

#|
;; Template
(define (count a-lon)
  (cond
    [(empty? a-lon) ...]
    [else ... (first a-lon) ...
          ... (count (rest a-lon)) ...]))
|#

(define (count a-lon)
  (cond
    [(empty? a-lon) 0]
    [else (+ 1 (count (rest a-lon)))]))

;; Examples:
(sum empty) "should be" 0
(sum (cons 1 (cons 2 (cons 3 empty)))) "should be" 6
(sum (cons 1.25 (cons 3.75 (cons 4.00 empty)))) "should be" 9.00

(count empty) "should be" 0
(count (cons 1 empty)) "should be" 1
(count (cons 1 (cons 2 (cons 3 empty)))) "should be" 3
(count (cons 1.25 (cons 3.75 (cons 4.00 empty)))) "should be" 3

(average-price (cons 1.00 empty)) "should be" 1.00
(average-price (cons 0.50 (cons 1.50 empty))) "should be" 1.00
(average-price (cons 1.25 (cons 3.75 (cons 4.00 empty)))) "should be" 3.00