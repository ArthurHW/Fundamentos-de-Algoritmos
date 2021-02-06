;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; 1.
;;    ------(----------)----
;;     -4  -3  -2  -1  0  1
;;
;; interval1 : number -> boolean
;; determines if x is in the above interval
;; EXAMPLES
;; -4, -3, 0 and 1 are outside the interval
;; -2 and -1 are inside the interval
(define (in-interval1? x)
  (and (< -3 x) (< x 0)))

;; 2.
;;    ------)---(------
;;      0   1   2   3 
;;
;; interval2 : number -> boolean
;; determines if x is in the above interval
;; EXAMPLES
;; 0 and 3 are inside the interval,
;; 1, 2, and 3/2 are outside the interval
(define (in-interval2? x)
  (or (< x 1) (> x 2)))

;; 3.
;;    ------)---------------(------
;;      0   1   2   3   4   5   6
;;
;; interval3 : number -> boolean
;; determines if x is in the above interval
;; EXAMPLES
;; 1, 3, and 5 are outside the interval
;; 0 and 6 are inside the interval

(define (in-interval3? x)
  (not (and (<= 1 x) (<= x 5))))

;; EXAMPLES TURNED INTO TESTS
(check-expect (in-interval1? -4) #false)
(check-expect (in-interval1? -3) #false)
(check-expect (in-interval1? 0) #false)
(check-expect (in-interval1? 1) #false)
(check-expect (in-interval1? -2) #true)
(check-expect (in-interval1? -1) #true)

(check-expect (in-interval2? 0) #true)
(check-expect (in-interval2? 3) #true)
(check-expect (in-interval2? 1) #false)
(check-expect (in-interval2? 2) #false)
(check-expect (in-interval2? 3/2) #false)

(check-expect (in-interval3? 1) #false)
(check-expect (in-interval3? 3) #false)
(check-expect (in-interval3? 5) #false)
(check-expect (in-interval3? 0) #true)
(check-expect (in-interval3? 6) #true)

;; hand evaluation:
(in-interval1? -2)
"should be"
(and (< -3 -2) (< -2 0))
"should be"
(and true (< -2 0))
"should be"
(< -2 0)
"should be"
true

(in-interval2? -2)
"should be"
(or (< -2 1) (> -2 2))
"should be"
(or true (> -2 2))
"should be"
true


(in-interval3? -2)
"should be"
(not (and (<= 1 -2) (<= -2 5)))
"should be"
(not (and false (<= -2 5)))
"should be"
(not false)
"should be"
true