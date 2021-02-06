;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; interval-1 : number -> boolean
;; determines if n is in the interval (3,7]

;; EXAMPLES
;; -1, 3, and 10 are outside
;; 5 and 7 are inside

(define (interval-1 n)
  (and (> n 3)
       (<= n 7)))

;; EXAMPLES TURNED INTO TESTS
(check-expect (interval-1 -1) #false)
(check-expect (interval-1 3) #false)
(check-expect (interval-1 5) #true)
(check-expect (interval-1 7) #true)
(check-expect (interval-1 10) #false)


;; interval-2 : number -> boolean
;; determines if n is in the interval [3,7]

;; EXAMPLES
;; -1 and 10 are outside the interval
;; 3, 5, and 7 are inside the interval

(define (interval-2 n)
  (and (>= n 3)
       (<= n 7)))

;; EXAMPLES TURNED INTO TESTS
(check-expect (interval-2 -1) #false)
(check-expect (interval-2 3) #true)
(check-expect (interval-2 5) #true)
(check-expect (interval-2 7) #true)
(check-expect (interval-2 10) #false)

;; interval-3 : number -> boolean
;; determines if n is in the interval [3,9)

;; EXAMPLES
;; -1, 9, 10 are all outside the interval
;; 3 and 5 are inside the interval

(define (interval-3 n)
  (and (>= n 3)
       (< n 9)))

(check-expect (interval-3 -1) #false)
(check-expect (interval-3 3) #true)
(check-expect (interval-3 5) #true)
(check-expect (interval-3 9) #false)
(check-expect (interval-3 10) #false)


;; interval-4 : number -> boolean
;; determines if n is in the combination of (1,3) and (9,11)

;; EXAMPLES
;; 1, 3, 5, 9, 11, and 50 are all outside the interval
;; 2, and 10 are inside the interval

(define (interval-4 n)
  (or (and (> n 1)
           (< n 3))
      (and (> n 9)
           (< n 11))))
(check-expect (interval-4 1) #false)
(check-expect (interval-4 2) #true)
(check-expect (interval-4 3) #false)
(check-expect (interval-4 5) #false)
(check-expect (interval-4 9) #false)
(check-expect (interval-4 10) #true)
(check-expect (interval-4 11) #false)
(check-expect (interval-4 50) #false)

;; interval-5 : number -> boolean
;; to determine if n is outside [1,3]

;; EXAMPLES
;; -100 and 100 are in the interval
;; 1 and 3 are outside the interval

(define (interval-5 n)
  (or (< n 1)
      (> n 3)))

(check-expect (interval-5 -100) #true)
(check-expect (interval-5 1) #false)
(check-expect (interval-5 3) #false)
(check-expect (interval-5 100) #true)