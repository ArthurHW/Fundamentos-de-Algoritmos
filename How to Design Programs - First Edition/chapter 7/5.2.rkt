;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; checked-profit : Scheme-value -> number
;; computes the profit for a price, 
;; signals an error for any other value
(define (checked-profit price)
  (cond
    [(and (number? price) (>= price 0))
     (profit price)]
    [else (error 'checked-profit "positive number expected")]))

;; profit : number -> number
(define (profit price)
  (- (revenue (attendance price) price) 
     (cost (attendance price))))

;; revenue : number number -> number
(define (revenue attendees price) 
  (* attendees price))

;; attendance : number -> number
(define (attendance price) 
  (+ (* (/ 15 .10) (- 5.00 price)) 
     120))

;; cost : number -> number
(define (cost attendees) 
  (+ (* attendees 1.6) 
     (* .04 (- attendees 120))))


;; checked-is-between-5-6 : anything -> boolean
;; to determine whether n is between 5 and 6 (exclusive) 
;; and signal an error is n is not a number
(define (checked-is-between-5-6 n)
  (cond
    [(number? n) (is-between-5-6 n)]
    [else (error 'checked-is-between-5-6 "number expected")]))

;; is-between-5-6 : number -> boolean
;; to determine whether n is between 5 and 6 (exclusive) 
(define (is-between-5-6 n) 
  (and (< 5 n) (< n 6))) 

;; checked-reply : Scheme-value -> symbol
;; to determine a reply for the greeting s 
;; if s is a known input; to signal an error otherwise
(define (checked-reply s)
  (cond
    [(and (symbol? s)
          (or (symbol=? s 'GoodMorning)
              (symbol=? s 'HowAreYou?)
              (symbol=? s 'GoodAfternoon)
              (symbol=? s 'GoodEvening)))
     (reply s)]
    [else (error 'checked-reply "expected either 'GoodMorning, 'HowAreYou?, 'GoodAfternoon, or 'GoodEvening")]))

;; reply : symbol -> symbol
;; to determine a reply for the greeting s 
(define (reply s)
  (cond 
    [(eq? s 'GoodMorning) 'Hi] 
    [(eq? s 'HowAreYou?) 'Fine] 
    [(eq? s 'GoodAfternoon) 'INeedANap] 
    [(eq? s 'GoodEvening) 'BoyAmITired])) 

;; checked-distance-to-0 : Scheme-value -> number
;; to compute the distance of a-posn to the origin, or
;; if a-posn is not a posn, to signal an error
(define (checked-distance-to-0 a-posn)
  (cond
    [(posn? a-posn) (distance-to-0 a-posn)]
    [else (error 'checked-distance-to-0 "expected a posn")]))

;; distance-to-0 : posn -> number
;; to compute the distance of a-posn to the origin
(define (distance-to-0 a-posn)
  (sqrt 
    (+ (sqr (posn-x a-posn)) 
       (sqr (posn-y a-posn))))) 

;; Data Definition:
(define-struct circle (center radius)) 
(define-struct square (nw length)) 
;; A shape is either 
;; 1. a structure: (make-circle p s) 
;;    where p is a posn, s a number; 
;; 2. a structure: (make-square p s) 
;;    where p is a posn, s a number.

;; checked-perimeter : Scheme-value -> number
(define (checked-perimeter a-shape)
  (cond
    [(or (circle? a-shape)
         (square? a-shape))
     (perimeter a-shape)]
    [else
     (error 'checked-perimeter "expected a shape")]))

;; perimeter : shape -> number 
;; to compute the perimeter of a-shape 
(define (perimeter a-shape) 
  (cond 
    [(circle? a-shape) 
     (* (* 2 (circle-radius a-shape)) pi)] 
    [(square? a-shape) 
     (* (square-length a-shape) 4)]))


;; EXAMPLES AS TESTS
(checked-profit 4) "should be" 642.0
;(checked-profit 'not-a-number) = error!

(checked-is-between-5-6 11/2) "should be" true
;(checked-is-between-5-6 false) = error!

(checked-reply 'GoodMorning) "should be" 'Hi
;(checked-reply 'GoToBed!) = error!

(checked-distance-to-0 (make-posn 5 12)) "should be" 13
;(checked-distance-to-0 5) = error!

(checked-perimeter (make-square (make-posn 1 1) 10)) "should be" 40
(checked-perimeter 'square) "should be" error!