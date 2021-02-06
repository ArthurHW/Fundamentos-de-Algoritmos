;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |2.2|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; search-sorted : number list-of-numbers -> boolean
;; to determine if n is is alon
(define (search-sorted n alon)
  (cond
    [(empty? alon) false]
    [else (cond
            [(= n (first alon)) true]
            [(< n (first alon)) false]
            [(> n (first alon)) (search-sorted n (rest alon))])]))

;; EXAMPLES AS TESTS
(search-sorted 0 empty) "should be" false

(search-sorted 2 (cons 1 (cons 2 (cons 3 (cons 4 empty)))))
"should be" true

(search-sorted 2 (cons 1 (cons 3 (cons 4 empty))))
"should be" false