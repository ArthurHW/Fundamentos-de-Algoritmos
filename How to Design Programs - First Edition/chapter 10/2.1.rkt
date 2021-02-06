;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; an inventory is either:
;;  - empty, or
;;  - (cons ir inv)
;; where ir is an inventroy record and inv is an inventory

;; An inventory record (ir) is a structure:
;;  (make-ir s n)
;; where s is a symbol and n is a posnum
(define-struct ir (name price))

;; contains-doll? : inventory -> boolean
;; determines if an-inv contains a record for 'doll.

#|
;; TEMPLATE
(define (contains-doll? an-inv)
  (cond
    [(empty? an-inv) ...]
    [else (ir-name (first an-inv)) ...
          (ir-price (first an-inv)) ...
          (contains-doll? (rest an-inv))]))
|#

(define (contains-doll? an-inv)
  (cond
    [(empty? an-inv) false]
    [else (or (symbol=? 'doll (ir-name (first an-inv)))
              (contains-doll? (rest an-inv)))]))

;; EXAMPLES AS TESTS

(contains-doll? empty) "should be" false
(contains-doll? (cons (make-ir 'rocket 1) empty)) "should be" false
(contains-doll? (cons (make-ir 'doll 1) empty)) "should be" true