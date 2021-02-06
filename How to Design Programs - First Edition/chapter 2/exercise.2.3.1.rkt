;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.2.3.1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; tax : number -> number
;; computes the tax, given a wage.

;; EXAMPLES
;; the tax on $100 is $15

(define (tax w)
  (* 0.15 w))

;; netpay : number -> number
;; computes the net pay, given the number of hours worked

;; EXAMPLES
;; the net pay for 40 hours is 408 dollars.

(define (netpay h)
  (- (wage h)
     (tax (wage h))))

;; wage : number -> number
;; computes the wage for a given number of hours

;; EXAMPLES
;; the wage for 2 hours is 24 dollars.

(define (wage h)
  (* h 12))


;; EXAMPLES TURNED INTO TESTS
(check-expect (tax 100) 15)
(check-expect (wage 2) 24)
(check-expect (netpay 40) 408)
