;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.2.2.1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; fahrenheit->celsius : number -> number
;; computes the celsius equivalent of t

;; EXAMPLES
;; 32 degrees fahrenheit is 0 degrees celsius
;; 212 degrees fahrenheit is 100 degrees celsius
;; -40 degrees fahrenheit is -40 degrees celsuis

(define (fahrenheit->celsius t)
  (* 5/9 (- t 32)))

;; EXAMPLES TURNED INTO TESTS
(check-expect (fahrenheit->celsius 32) 0)
(check-expect (fahrenheit->celsius 212) 100)
(check-expect (fahrenheit->celsius -40) -40)
