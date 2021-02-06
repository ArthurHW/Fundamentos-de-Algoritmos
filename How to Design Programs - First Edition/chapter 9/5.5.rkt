;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; CONVERT:
;; A digit is in 0, ..., 9.
;; A list of digits is either
;;  - empty
;;  - (cons digit lod) where lod is a list of digits.

;; CONTRACT/HEADER/PURPOSE
;; convert : list-of-DIGIT -> number
;; to convert a vector of digits into a number 
;; 0-th digit is right-most digit in number, 
;; N-th digit is left-most digit in number
;(define (convert digits) ...)

;; Examples: 
;; convert (cons 1 (cons 2 (cons 3 empty))) is 321
;; (convert (cons 4 (cons 5 (cons 6 empty)))) = 654

;; TEMPLATE
;(define (convert digits) 
;  (cond
;    ((empty? digits) ...)
;    (else ... (first digits) ... (convert (rest digits)) ...)))

;; DEFINITION: 
(define (convert digits) 
  (cond
    ((empty? digits) 0)
    (else (+ (first digits) (* (convert (rest digits)) 10)))))


;; check-guess-for-list : (listof DIGIT) number -> symbol
;; to determine how guess digits and target relate to each other 
;; EXAMPLES: see below 
;; REUSE: check-guess from section 4 (ex 4.1.2)
(define (check-guess-for-list guess-list target)
  (check-guess (convert guess-list) target))

;; check-guess : number number -> symbol 
;; to determine how guess and target relate to each other 
;; REUSED: ex 4.1.2
(define (check-guess guess target)
  (cond
    ((< target guess) 'TooLarge)
    ((= target guess) 'Perfect)
    ((> target guess) 'TooSmall)))

;; TESTS for convert:
(convert (cons 1 (cons 2 (cons 3 empty)))) "should be" 321
(convert (cons 4 (cons 5 (cons 6 empty)))) "should be" 654

;; EXAMPLES/TESTS for check-guess-for-list:
(check-guess-for-list (cons 0 (cons 0 (cons 5 empty))) 631) "should be" 'TooSmall
(check-guess-for-list (cons 6 (cons 0 (cons 7 empty))) 631) "should be" 'TooLarge
(check-guess-for-list (cons 1 (cons 3 (cons 6 empty))) 631) "should be" 'Perfect