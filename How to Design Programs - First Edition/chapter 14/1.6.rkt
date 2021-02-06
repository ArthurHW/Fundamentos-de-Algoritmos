;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.6|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
#|

The friend's solution would always return 
false, no matter what the input is.

|#

;; A family-tree-node (short: ftn) ie either:
;; 1. empty, or
;; 2. (make-child f m na da ec)
;;    where f and m and ftns,
;;          na and ec are symbols,
;;      and da is a number
(define-struct child (father mother name date eyes))

;; Oldest Generation:
(define Carl (make-child empty empty 'Carl 1926 'green)) 
(define Bettina (make-child empty empty 'Bettina 1926 'green))
(define Timothy (make-child empty empty 'Timothy 1927 'blue))

;; Middle Generation: 
(define John (make-child Timothy empty 'John 1927 'blue))
(define Adam (make-child Carl Bettina 'Adam 1950 'yellow))
(define Dave (make-child Carl Bettina 'Dave 1955 'black)) 
(define Eva (make-child Carl Bettina 'Eva 1965 'blue))
(define Fred (make-child empty empty 'Fred 1966 'pink))

;; Youngest Generation:  
(define Gustav (make-child Fred Eva 'Gustav 1988 'brown)) 
;; blue-eyed-ancestor? : ftn -> boolean
;; to determine whether a-ftree contains a child 
;; structure with 'blue in the eyes field 
;; version 1: using a nested cond-expression 


;; proper-blue-eyed-ancestor? : ftn -> boolean
;; to determine whether a-ftree contains a child 
;; structure with 'blue in the eyes field, unless it is the first child.
(define (proper-blue-eyed-ancestor? a-ftree) 
  (cond
    [(empty? a-ftree) false]
    [else (or (blue-eyed-ancestor? (child-father a-ftree))
              (blue-eyed-ancestor? (child-mother a-ftree)))]))
           
;; blue-eyed-ancestor? : ftn -> boolean
;; to determine if a-ftree contains a child with
;; blue eyes, including itself
(define (blue-eyed-ancestor? a-ftree)
  (cond
    [(empty? a-ftree) false]
    [else (or (eq? 'blue (child-eyes a-ftree))
              (blue-eyed-ancestor? (child-father a-ftree))
              (blue-eyed-ancestor? (child-mother a-ftree)))]))

;; EXAMPLES AS TESTS
(proper-blue-eyed-ancestor? John) "should be" true
(proper-blue-eyed-ancestor? Gustav) "should be" true
(proper-blue-eyed-ancestor? Eva) "should be" false