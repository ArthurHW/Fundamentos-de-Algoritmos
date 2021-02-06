;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.3.1.1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; attendance : number -> number
;; to compute how many attendees we get at some price 
;; Examples:
;; at 5.0, we get 120
;; at 4.9, we get 135
(define (attendance price)
  (+ (* (/ 15 .10) (- 5.00 price))
     120))

;; at $5.00, 120 people will attend.
;; at $4.00, 270 people will attend.
;; at $3.00, 420 people will attend.

;; EXAMPLES AS TESTS
(check-expect (attendance 5.0) 120)
(check-expect (attendance 4.9) 135)
(check-expect (attendance 4) 270)
(check-expect (attendance 3) 420)
