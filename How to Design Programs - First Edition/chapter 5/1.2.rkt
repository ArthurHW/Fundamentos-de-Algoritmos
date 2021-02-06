;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;; check-guess : number number -> symbol
;; to determine whether guess is larger, smaller, or equal to target

;; EXAMPLES
;; if the guess is 1 and the target is 1,
;; the answer should be 'Perfect
;; if the guess is 1 and the target is 2,
;; the answer should be 'TooSmall
;; if the guess is 1 and the target is 0, 
;; the answer should be 'TooLarge

(define (check-guess guess target)
  (cond
    ((= guess target) 'Perfect)
    ((< guess target) 'TooSmall)
    ((> guess target) 'TooLarge)))

;; EXAMPLES TURNED INTO TESTS:
(check-expect (check-guess 1 1) 'Perfect)
(check-expect (check-guess 1 2) 'TooSmall)
(check-expect (check-guess 1 0) 'TooLarge)

;; after setting teachpack to guess.ss
;(repl check-guess)
(guess-with-gui check-guess)