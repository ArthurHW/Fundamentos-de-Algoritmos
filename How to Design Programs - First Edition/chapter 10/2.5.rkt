;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; extract>1 : inventory -> inventory
;; extracts the portion of the inventory whose prices are bigger than $1

(define-struct ir (name price))
#|
;; Template
(define (extract>1 inv)
  (cond
    [(empty? inv) ...]
    [else (ir-name (first inv))
          (ir-price (first inv))
          (extract>1 (rest inv))]))
|#

(define (extract>1 inv)
  (cond
    [(empty? inv) empty]
    [else (cond
            [(> (ir-price (first inv)) 1)
             (cons (first inv) (extract>1 (rest inv)))]
            [else 
             (extract>1 (rest inv))])]))

;; Examples
(extract>1 empty) "should be" empty
(extract>1 (cons (make-ir 'doll .50) empty)) "should be" empty
(extract>1 (cons (make-ir 'rocket 1.50) empty))
"should be"
(cons (make-ir 'rocket 1.50) empty)