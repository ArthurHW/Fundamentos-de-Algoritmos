;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex27_refactored_movie_teather_problem) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define initial-price 5.0)
(define initial-attendees 120)
(define fixed-cost 180)
(define variable-cost 0.04)
(define price-variation 0.1)
(define attendees-variation 15)
(define (attendees ticket-price)
  (- initial-attendees (* (- ticket-price initial-price) (/ attendees-variation price-variation))))
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))
(define (cost ticket-price)
  (+ fixed-cost (* variable-cost (attendees ticket-price))))
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

