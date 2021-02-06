;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; contains? : symbol list-of-symbols -> boolean
;; determines if a-symbol appears on a-list

#|
;; TEMPLATE
(define (contains? a-symbol a-list)
  (cond
    [(empty? a-list) ...]
    [else (first a-list) ...
          (contains? a-symbol (rest a-list)) ...]))
|#

(define (contains? a-symbol a-list)
  (cond
    [(empty? a-list) false]
    [else (or (symbol=? a-symbol (first a-list))
              (contains? a-symbol (rest a-list)))]))

(contains? 'doll empty) "should be" false
(contains? 'doll (cons 'doll empty)) "should be" true
(contains? 'doll (cons 'rocket empty)) "should be" false