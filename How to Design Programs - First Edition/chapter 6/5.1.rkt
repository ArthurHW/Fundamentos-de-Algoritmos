;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; movie-template : movie -> ???
(define (movie-template a-movie)
  ... (movie-title a-movie) ...
  ... (movie-producer a-movie) ...)

;; boyfriend-template : boyfriend -> ???
(define (boyfriend-template a-boyfriend)
  ... (boyfriend-name a-boyfriend) ...
  ... (boyfriend-hair a-boyfriend) ...
  ... (boyfriend-eyes a-boyfriend) ...
  ... (boyfriend-phone a-boyfriend) ...)

;; cheerleader-template : cheerleader -> ???
(define (cheerleader-template a-cheerleader)
  ... (cheerleader-name a-cheerleader) ...
  ... (cheerleader-number a-cheerleader) ...)

;; CD-template : CD -> ???
(define (CD-template a-CD)
  ... (CD-artist a-CD) ...
  ... (CD-title a-CD) ...
  ... (CD-price a-CD) ...)

;; sweater-template : sweater -> ???
(define (sweater-template a-sweater)
  ... (sweater-material a-sweater) ...
  ... (sweater-size a-sweater) ...
  ... (sweater-producer a-sweater) ...)