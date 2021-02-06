;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.2.2.3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; triangle : number number -> number
;; obj: calculates the area of a triangle, given its base and height
;; EXAMPLES:
;; if the base is 10 and the height is 5, the area of the triangle is 25.
;; if the base is 2 and the height is 5, the area of the triangle is 5.

(define (triangle-area base height)
  (* 1/2 base height))

;; EXAMPLES TURNED INTO TEST CASES:
(check-expect (triangle-area 10 5) 25)
(check-expect (triangle-area 2 5) 5)
