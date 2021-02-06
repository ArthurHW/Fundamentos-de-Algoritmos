;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.37|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define-struct ir (name price))

;; price-of : symbol inventory -> number or 'not-in-inventory
;; determines the price of sym in inv

#|
;; Template
(define (price-of sym inv)
  (cond
    [(empty? inv) ...]
    [else (ir-name (first inv))
          (ir-price (first inv))
          (price-of sym (rest inv))]))
|#

(define (price-of sym inv)
  (cond
    [(empty? inv) 'not-in-inventory]
    [else (cond
            [(eq? (ir-name (first inv)) sym)
             (ir-price (first inv))]
            [else
             (price-of sym (rest inv))])]))

;; Examples
(price-of 'rocket empty) "should be" 'not-in-inventory
(price-of 'rocket (cons (make-ir 'rocket 3.22) empty)) "should be" 3.22
(price-of 'rocket (cons (make-ir 'doll 1.21)
                        (cons (make-ir 'rocket 3.22)
                              empty)))
"should be" 
3.22