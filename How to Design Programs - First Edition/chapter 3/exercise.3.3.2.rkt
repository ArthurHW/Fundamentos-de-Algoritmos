;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.3.3.2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; volume-cylinder : number number -> number
;; to determine to volume of a cylinder from its radius and height
(define (volume-cylinder radius height)
  (* (area-circle radius) height))

;; area-circle : number -> number
;; to determine the area of a circle
(define (area-circle radius)
  (* radius radius pi))

;; EXAMPLES AS TESTS
;; (check-expect (area-circle 1) pi)
;; (check-expect (volume-cylinder 3 2) (* 18 pi))