;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.1|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; Language: Beginning Student

;      11 'Bobby
;         \  
;          \
;         12 'Luke


;      11 'Bobby
;        /  
;       /
;    24 'Luke


;      11 'Bobby
;        /     \
;       /       \
;    24 'Luke    5  'Paul


#|
A BT is either
  1. false; or
  2. (make-node soc pn lft rgt) 
     where soc is a number, pn is a symbol, and lft and rgt are BTs.
|#
(define-struct node (ssn name left right))

(define bt1 (make-node 11 'Bobby false (make-node 12 'Luke false false)))
(define bt2 (make-node 11 'Bobby (make-node 12 'Luke false false) false))
(define bt3 (make-node 11 'Bobby (make-node 12 'Luke false false) (make-node 5 'Paul false false))) 

;; bt-contains?: number BT -> boolean
;; consumes a number and binary-tree and determines if a-bt contains n
(define (bt-contains? n a-bt)
  (cond
    [(boolean? a-bt) false]
    [else
     (or (= n (node-ssn a-bt))
         (bt-contains? n (node-left a-bt))
         (bt-contains? n (node-right a-bt)))]))

(equal? (bt-contains? 11 bt1) true)
(equal? (bt-contains? 5 bt3) true)
(equal? (bt-contains? 9 bt3) false)
(equal? (bt-contains? 12 bt2) true)
(equal? (bt-contains? 5 bt2) false)
(equal? (bt-contains? 12 bt3) true)