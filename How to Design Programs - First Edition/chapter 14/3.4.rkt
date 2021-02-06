;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.4|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; Language: Intermediate Student

;; depth: web-page -> number
;; computes the depth of embedded web-pages
(define (depth a-wp)
  (cond
   [(empty? a-wp) 0]
   [(symbol? (first a-wp))
    (depth (rest a-wp))]
   [else
    (max (+ (depth (first a-wp)) 1)
         (depth (rest a-wp)))]))

;;; tests
(check-expect (depth '()) 0)
(check-expect (depth '(a)) 0)
(check-expect (depth '(())) 1)
(check-expect (depth '(a b c)) 0)
(check-expect (depth '(a (b (c (d))) e (f (g)) h))
              3)