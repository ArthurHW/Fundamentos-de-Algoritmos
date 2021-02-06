;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise2.2.2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; The dollar/euro conversion rate was roughly 1.17 euros per dollar
;; when the euro was introduced on January 1, 1999.
;; (source: The Economist).

;; dollar->euro : number -> number
;; computes the value of d dollars in euros

;; EXAMPLES
;; one dollar is 1.17 euros
;; one dollar is 2.34 euros

(define (dollar->euro d)
  (* 1.17 d))

;; EXAMPLES TURNED INTO TESTS
(check-expect (dollar->euro 1) 1.17)
(check-expect (dollar->euro 2) 2.34)
