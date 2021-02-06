;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.6|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; DATA DEFINITIONS 
(define-struct node (ssn name left right))
; A binary tree is either
;   1. false or 
;   2. (make-node soc pn lft rgt) 
;         where soc is a number, pn is a symbol, and lft and rgt are binary 
;         trees. 

;; EXAMPLES
; (create-bst false 6 'b) => (make-node 6 'b false false)
;
; (create-bst (make-node 4 'a false false) 5 'a) 
; =>
; (make-bst 4 'a false (make-bst 5 'a false false))
;
; (create-bst (make-node 4 'a false false) 3 'g)
; =>
; (make-node 4 'a (make-node 3 'g false false) false)
;
; (create-bst (make-node 4 'a (make-node 2 'a false false) false) 3 'g)
; =>
; (make-node 4 'a (make-node 2 'a false (make-node 3 'g)))

;; TEMPLATE: 
;(define (bst-fun abt)
;  (cond
;    ((boolean? abt) ...)
;    ((node? abt)
;     ... (node-ssn abt) ... (node-name abt) ... 
;     ... (bst-fun (node-left abt)) ... (bst-fun (node-right abt)) ... )))

;; CONTRACT/HEADER/PURPOSE: 
;; create-bst : binary-tree number symbol -> binary-tree
;; to create a binary search tree with the same values as the input tree
;; and also the given number associated with the given name
(define (create-bst bst n s) 
  (cond
    [(eq? bst false) (make-node n s false false)]
    [else
     (cond
       [(< n (node-ssn bst)) 
        (make-node (node-ssn bst)
                   (node-name bst)
                   (create-bst (node-left bst) n s)
                   (node-right bst))]
       [(> n (node-ssn bst)) 
        (make-node (node-ssn bst)
                   (node-name bst)
                   (node-left bst)
                   (create-bst (node-right bst) n s))]
       [else (error 'create-bst "Number already in BST")])]))

(equal? (create-bst false 6 'b)  (make-node 6 'b false false))
(equal? (create-bst (make-node 4 'a false false) 5 'a)
        (make-node 4 'a false (make-node 5 'a false false)))
(equal? (create-bst (make-node 4 'a false false) 3 'g)
        (make-node 4 'a (make-node 3 'g false false) false))
(equal? (create-bst (make-node 4 'a (make-node 2 'a false false) false) 3 'g)
        (make-node 4 'a (make-node 2 'a false (make-node 3 'g false false)) false))

; -------------------------------------------------------------------------

; DATA DEFINITIONS
; A BST is as defined in section 14.2.
; A list-of-numbers-and-symbols is either
;  1. empty
;  2. (cons (list number symbol) list-of-numbers-and-symbols)

; EXAMPLES
; (create-bst-from-list '()) => false
; (create-bst-from-list '((1 a) (18 b) (2 g)) 
; => 
; (make-node 2 'g
;   (make-node 1 'a false false)
;   (make-node 18 'b false false))

; TEMPLATE
; (define (fun-for-lons lons)
;   (cond
;     [(empty? lons) ...]
;     [else
;      ... (first lons) ...
;      ... (fun-for-lons (rest lons)) ...]))

; create-bst-from-list : list-of-numbers-and-symbols -> binary-tree
; to produce a binary tree with all the numbers in the input list
; associated with their corresponding symbols
(define (create-bst-from-list lons)
  (cond
    [(empty? lons) false]
    [else
     (create-bst 
      (create-bst-from-list (rest lons))
      (first (first lons))
      (second (first lons)))]))

(equal? (create-bst-from-list '()) false)
(equal? 
 (create-bst-from-list '((1 a) (18 b) (2 g)))
 (make-node 2 'g (make-node 1 'a false false) (make-node 18 'b false false)))