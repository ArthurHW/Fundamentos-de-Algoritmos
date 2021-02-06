;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.7|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; An inventory is either:
;;   - empty, or
;;   - (cons IR INV)
;; where IR is an inventory-record, and
;;       INV is an inventory

;; An inventory-record is:
;;   (make-ir S N)
;; where S is a symbol, and
;;       N is a number.
(define-struct ir (name price))

;; raise-prices : inventory -> inventory
;; raises all prices in an-inv by 5%

#|
;; TEMPLATE 
(define (raise-prices an-inv)
  (cond
    [(empty? an-inv) ...]
    [else (ir-name (first an-inv)) ...
          (ir-price (first an-inv)) ...
          (raise-prices (rest an-inv)) ...]))
|#
(define (raise-prices an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (cons
           (make-ir (ir-name (first an-inv))
                    (* 1.05 (ir-price (first an-inv))))
           (raise-prices (rest an-inv)))]))

;; EXAMPLES AS TESTS
(raise-prices empty) "should be" empty
(raise-prices (cons (make-ir 'rocket 1.00) empty)) "should be" (cons (make-ir 'rocket 1.05) empty)
(raise-prices (cons (make-ir 'rocket 1.00) (cons (make-ir 'doll 1.40) empty))) "should be"
(cons (make-ir 'rocket 1.05) (cons (make-ir 'doll 1.47) empty))