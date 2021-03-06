;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; a zoo-animal is either:
;;   (make-spider LEGS SPACE)
;;   (make-elephants SPACE)
;;   (make-monkey INTELLIGENCE SPACE)
;; where LEGS and SPACE is a number, and
;; INTELLIGENCE is a symbol, one of:
;;   'homer 'marge 'lisa (indicating dumb, average, or smart, repectively)

(define-struct spider (legs space))
(define-struct elephant (space))
(define-struct monkey (intelligence space))

;; fits?: zooanimal number -> boolean
;; given a animal and the volume of a cage, determine if the cage is large enough
;; for the animal
;; Examples:
;; .....
(define (fits? animal volume)
  (cond
    [(spider? animal) (> (spider-SPACE animal) volume)]
    [(elephant? animal) (> (elephant-SPACE animal) volume)]
    [(monkey? animal) (> (monkey-SPACE animal) volume)]))