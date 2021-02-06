;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.2|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; A parent is a structure: (make-parent loc n d e) 
;; where loc is a list of children, 
;; n and e are symbols, and d is a number. 
(define-struct parent (children name date eyes))

;; A list of children is either 
;;   1.  empty or 
;;   2.  (cons p loc) where p is a parent and loc is a list of children. 

;; EXAMPLES OF DATA
(define robby (make-parent empty "Robby" 1972 'blue))
(define ted (make-parent empty "Ted" 1975 'brown))
(define pat (make-parent empty "Pat" 1978 'brown))
(define pete (make-parent empty "Pete" 1982 'brown))
(define alice (make-parent (list robby ted pat pete) "Alice" 1949 'blue))
(define bill (make-parent (list robby ted pat pete) "Bill" 1949 'brown))
(define lolly (make-parent empty "Lolly" 1951 'blue))
(define tutu (make-parent (list alice lolly) "Tutu" 1911 'brown))

;; how-far-removed : parent -> number or false
;; to find the distance to the nearest blue eyed descendent
;; or return false if there is no such descendant
(define (how-far-removed a-parent)
  (cond
    [(symbol=? 'blue (parent-eyes a-parent))
     0]
    [else
     (add1/false
      (how-far-removed-children
       (parent-children a-parent)))]))
    
;; how-far-removed-children : list of children -> number or false
;; to find the nearest blue eyed descent for a list of children,
;; assuming that one exists
(define (how-far-removed-children children)
  (cond
    [(empty? children) false]
    [else (min/false (how-far-removed (first children))
                     (how-far-removed-children (rest children)))]))

;; add1/false : number or false -> number or false
;; to add one to a number, or return false
(define (add1/false n)
  (cond
    [(number? n) (+ n 1)]
    [else false]))

;; min/false : (number or false) (number or false) -> (number or false)
;; to compute the minimum number of two numbers
;; if both are numbers, find the minimum.
;; if only one is a number, return that.
;; if both are false, return false.
(define (min/false n m)
  (cond
    [(and (number? n) (number? m)) (min n m)]
    [(and (number? n) (boolean? m)) n]
    [(and (boolean? n) (number? m)) m]
    [(and (boolean? n) (boolean? m)) false]))

;; EXAMPLES AS TESTS
(how-far-removed ted) "should be" false
(how-far-removed robby) "should be" 0
(how-far-removed alice) "should be" 0
(how-far-removed bill) "should be" 1
(how-far-removed tutu) "should be" 1