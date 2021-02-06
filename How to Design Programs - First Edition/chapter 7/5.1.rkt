;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; area-of-disk : number -> number
;; to compute the area of a disk with radius r
(define (area-of-disk r)
  (* 3.14 (* r r)))

;; checked-area-of-disk : Scheme-value -> boolean
;; to compute the area of a disk with radius v,
;; if v is a number.
(define (checked-area-of-disk v)
  (cond
    [(and (number? v) (>= v 0))
     (area-of-disk v)]
    [else (error 'checked-area-of-disk "positive number expected")]))

;; EXAMPLES AS TESTS
(checked-area-of-disk 1) "should be" 3.14
(checked-area-of-disk -1) error!