;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.7|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; recall : symbol list-of-symbols -> list-of-symbols
;; removes the symbol ty from the list of symbols lon.

#|
;; Template
(define (recall ty lon)
  (cond
    [(empty? lon) ...]
    [else ... (first lon) ...
          ... (recall ty (rest lon)) ...]))
|#

(define (recall ty lon)
  (cond
    [(empty? lon) empty]
    [else 
     (cond 
       [(eq? (first lon) ty)
        (recall ty (rest lon))]
       [else
        (cons (first lon)
              (recall ty (rest lon)))])]))

;; Examples

(recall 'doll empty) "should be" empty
(recall 'doll (cons 'doll empty)) "should be" empty
(recall 'rocket (cons 'doll empty)) "should be" (cons 'doll empty)
(recall 'elephant (cons 'doll (cons 'elephant (cons 'rocket empty))))
"should be"
(cons 'doll (cons 'rocket empty))