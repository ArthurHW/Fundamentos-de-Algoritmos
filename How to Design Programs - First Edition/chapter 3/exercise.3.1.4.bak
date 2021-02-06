;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.3.1.4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; How to design a program  
(define (profit-left ticket-price) 
  (- (revenue ticket-price) 
     (cost ticket-price))) 

(define (revenue ticket-price) 
  (*  (attendees ticket-price) ticket-price)) 

(define (cost ticket-price) 
  (+ 180  
     (* .04 (attendees ticket-price)))) 

(define (attendees ticket-price) 
  (+ 120 
     (* (/ 15 .10) (- 5.00 ticket-price)))) 


;; How not to design a program  
(define (profit-right price) 
  (- (* (+ 120 
           (* (/ 15 .10) 
              (- 5.00 price))) 
        price) 
     (+ 180  
        (* .04 
           (+ 120 
              (* (/ 15 .10) 
                 (- 5.00 price))))))) 


;; results for original profit-left and profit-right
(check-expect (profit-left 3.00) (profit-right 3.00))
(check-expect (profit-left 4.00) (profit-right 4.00))
(check-expect (profit-left 5.00) (profit-right 5.00))