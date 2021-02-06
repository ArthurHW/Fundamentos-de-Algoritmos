;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.3.3.3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; area-cylinder : number number -> number
;; to determine the area of a cylinder
(define (area-cylinder radius height)
  (+ (* (circumference-circle radius) height)
     (area-circle radius)
     (area-circle radius)))

;; area-circle : number -> number
;; to determine the area of a circle
(define (area-circle radius)
  (* pi radius radius))

;; circumference-circle : number -> number
;; to deteremine the circumference of a circle
(define (circumference-circle radius)
  (* radius 2 pi))

;; EXAMPLES AS TESTS
;; (check-expect (circumference-circle 2) (* 4 pi))
;; (check-expect (area-circle 3) (* pi 9))
;; (check-expect (area-cylinder 2 3) (* 20 pi))
;; (check-expect (area-cylinder 3 4) (* 42 pi))
