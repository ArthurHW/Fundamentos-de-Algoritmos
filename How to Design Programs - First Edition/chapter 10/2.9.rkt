;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.9|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define-struct ir (name price))

;; name-robot : inventory -> inventory
;; changes 'robot to 'r2d2 in inv

#|
;; Template 
(define (name-robot inv)
  (cond
    [(empty inv) ...]
    [else (ir-name (first inv))
          (ir-price (first inv))
          (name-robot (rest inv))]))
|#

(define (name-robot inv)
  (cond
    [(empty? inv) empty]
    [else (cond
            [(eq? 'robot (ir-name (first inv)))
             (cons (make-ir 'r2d2 (ir-price (first inv)))
                   (name-robot (rest inv)))]
            [else
             (cons (first inv)
                   (name-robot (rest inv)))])]))

;; examples
(name-robot empty) "should be" empty
(name-robot (cons (make-ir 'doll 1.21) empty)) "should be" 
(cons (make-ir 'doll 1.21) empty)

(name-robot (cons (make-ir 'robot 1.21) empty)) "should be"
(cons (make-ir 'r2d2 1.21) empty)

(name-robot (cons (make-ir 'robot 1.21)
                  (cons (make-ir 'doll 2.12)
                        (cons (make-ir 'robot 2.23)
                              empty))))
"should be"
(cons (make-ir 'r2d2 1.21)
      (cons (make-ir 'doll 2.12)
            (cons (make-ir 'r2d2 2.23)
                  empty)))