;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.8|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; recall : inventory symbol -> inventory
;; removes all of the items from inv whose names match sym

(define-struct ir (name price))

#|
;; Template
(define (recall inv sym)
  (cond
    [(empty? inv) ...]
    [else (ir-name (first inv))
          (ir-price (first inv))
          (recall (rest inv) sym)]))
|#

(define (recall inv sym)
  (cond
    [(empty? inv) empty]
    [else (cond
            [(eq? (ir-name (first inv)) sym)
             (recall (rest inv) sym)]
            [else
             (cons (first inv)
                   (recall (rest inv) sym))])]))

(recall empty 'doll) "should be" empty
(recall (cons (make-ir 'doll 2.31) empty) 'doll) "should be" empty
(recall (cons (make-ir 'rocket 1.21) empty) 'doll) "should be" 
(cons (make-ir 'rocket 1.21) empty)

(recall (cons (make-ir 'rocket 1.21)
              (cons (make-ir 'rocket 1.21)
                    (cons (make-ir 'doll 2.31)
                          (cons (make-ir 'rocket 1.21)
                                empty))))
        'rocket)
"should be"
(cons (make-ir 'doll 2.31) empty)