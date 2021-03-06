;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; a speed vector (vec) is a structure:
;;     (make-vec x y)
;; where x and y are both positive numbers
(define-struct vec (x y))

;; checked-make-vec : Scheme-value Scheme-value -> vec
(define (checked-make-vec x y)
  (cond
    [(and (number? x)
          (number? y)
          (> x 0)
          (> y 0))
     (make-vec x y)]
    [else (error 'checked-make-vec "expected two positive numbers")]))

;; examples as tests
(checked-make-vec 10 10)
(checked-make-vec -1 'not-a-number) 