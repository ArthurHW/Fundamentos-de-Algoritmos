;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; contains-doll? : list-of-symbols -> boolean
;; returns true if a-list-of-symbols contains the symbol 'doll
;; and returns false if a-list-of-symbols does not contain 'doll.
(define (contains-doll? a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) false]
    [else
     (cond
       [(eq? (first a-list-of-symbols) 'doll) true]
       [else (contains-doll? (rest a-list-of-symbols))])]))

;; Examples
(contains-doll? empty) "should be" false
(contains-doll? (cons 'ball empty)) "should be" false
(contains-doll? (cons 'arrow (cons 'doll empty))) "should be" true
(contains-doll? (cons 'bow (cons 'arrow (cons 'ball empty)))) "should be" false
(contains-doll? (cons 'make-up-set
                      (cons 'clown
                            (cons 'arrow
                                  (cons 'doll
                                        (cons 'ball
                                              empty))))))
"should be"
true