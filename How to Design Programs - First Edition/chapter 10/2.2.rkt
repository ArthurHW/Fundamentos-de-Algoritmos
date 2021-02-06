;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; an inventory is either:
;;  - empty, or
;;  - (cons inventory-record inventory)

;; an inventory-record is:
;;   (make-inventory-record name price picture)
;; where name is a symbol,
;;       price is a number, and
;;       picture is a picture
(define-struct inventory-record (name price picture))

;; show-picture : inventory symbol -> picture or false
;; finds the picture in an-inv corresponding to a-name,
;; or returns false if there is no such picture

#|
;; TEMPLATE
(define (show-picture an-inv a-name)
  (cond
    [(empty? an-inv) ...]
    [else 
     (inv-name (first an-inv)) ...
     (inv-price (first an-inv)) ...
     (inv-picture (first an-inv)) ...
     (show-picture (rest an-inv) a-name) ...]))
|#

(define (show-picture an-inv a-name)
  (cond
    [(empty? an-inv) false]
    [else 
     (cond
       [(symbol=? a-name (inventory-record-name (first an-inv)))
        (inventory-record-picture (first an-inv))]
       [else
        (show-picture (rest an-inv) a-name)])]))

;; EXAMPLES AS TESTS
(define lock-picture 'LOCK) ;; use the "Insert Image..." menu item to use a real picture
(define lock-inventory 
  (cons (make-inventory-record 'lock 1.95 lock-picture)
        empty))
(show-picture empty 'lock) "should be" false
(show-picture lock-inventory 'doll) "should be" false
(show-picture lock-inventory 'lock) "should be" lock-picture