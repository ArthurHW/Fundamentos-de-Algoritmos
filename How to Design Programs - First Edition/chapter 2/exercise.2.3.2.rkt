;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.2.3.2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; sum-coins : number number number number -> number
;; computes the value of p pennies, n nickels, d dimes and q quarters,
;; in pennies.

;; EXAMPLES
;; 1 penny should be worth 1 penny.
;; 1 nickel should be worth 5 pennies.
;; 1 dime should be worth 10 pennies.
;; 1 quarter should be worth 25 pennies.
;; 1 penny, 1 nickel, 1 dime and 1 quarter should be worth 41 pennies.

(define (sum-coins p n d q)
  (+ (* p 1)
     (* n 5)
     (* d 10)
     (* q 25)))

;; EXAMPLES TURNED INTO TESTS
(check-expect (sum-coins 1 0 0 0) 1)
(check-expect (sum-coins 0 1 0 0) 5)
(check-expect (sum-coins 0 0 1 0) 10)
(check-expect (sum-coins 0 0 0 1) 25)
(check-expect (sum-coins 1 1 1 1) 41)
