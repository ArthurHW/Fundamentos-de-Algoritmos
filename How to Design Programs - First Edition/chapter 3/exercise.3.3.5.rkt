;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.3.3.5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; height : number number -> number
;; to determine the height a rocket reaches in a time t.
(define (height g t)
  (height-from-speed t (speed-from-time g t)))

;; height-from-speed : number number -> number
;; to determine the height a rocket reaches from its speed and time
(define (height-from-speed t v)
  (* 1/2 v t))

;; speed-from-time : number number -> number
;; to determine the speed a rocket reaches in time t
(define (speed-from-time g t)
  (* g t))

;; EXAMPLES AS TESTS
(check-expect (speed-from-time 10 1) 10)
(check-expect (height-from-speed 10 5) 25)
(check-expect (height 10 10) 500)