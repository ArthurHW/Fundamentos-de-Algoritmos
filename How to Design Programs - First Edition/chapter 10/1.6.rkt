;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.6|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; name-robot : list-of-symbols -> list-of-symbols
;; replaces the word 'robot in the list of symbols with 'r2d2

#|

;; Template
(define (name-robot a-los)
  (cond
    [(empty? a-los) ...]
    [else ... (first a-los) ...
          ... (name-robot (rest a-los)) ...]))

|#

(define (name-robot a-los)
  (cond
    [(empty? a-los) empty]
    [else
     (cond
       [(eq? (first a-los) 'robot)
        (cons 'r2d2 (name-robot (rest a-los)))]
       [else
        (cons (first a-los) (name-robot (rest a-los)))])]))

;; Examples

(name-robot empty) "should be" empty
(name-robot (cons 'robot empty)) "should be" (cons 'r2d2 empty)
(name-robot (cons 'doll empty)) "should be" (cons 'doll empty)

(name-robot (cons 'robot (cons 'robot empty))) 
"should be"
(cons 'r2d2 (cons 'r2d2 empty))

(name-robot (cons 'doll 
                  (cons 'robot
                        (cons 'monopoly
                              (cons 'robot
                                    (cons 'raygun
                                          (cons 'dress
                                                empty)))))))
"should be"
(cons 'doll 
      (cons 'r2d2
            (cons 'monopoly
                  (cons 'r2d2
                        (cons 'raygun
                              (cons 'dress empty))))))

;; substitute: symbol symbol list-of-symbols -> list of symbols
;; given the old and the new toy, replace all the occurences of the old toy
;; in the lista with the new toy
;; Examples:
(define (substitute new old a-los)
  (cond
    [(empty? a-los) empty]
    [else
     (cond
       [(eq? (first a-los) old)
        (cons new (name-robot (rest a-los)))]
       [else
        (cons (first a-los) (name-robot (rest a-los)))])]))