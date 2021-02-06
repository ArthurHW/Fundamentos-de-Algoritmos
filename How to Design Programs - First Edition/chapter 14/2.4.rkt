;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.4|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct node (ssn name left right))

;; A binary tree is either
;;   1. false or 
;;   2. (make-node soc pn lft rgt) 
;;         where soc is a number, pn is a symbol,
;;         and lft and rgt are bts. 


;; A binary-search-tree (BST) is a BT:
;;  - false is always a BST
;;  - (make-node soc pn lft rgt) is a BST if 
;;    1. lft and rgt are BST s, 
;;    2. all ssn numbers in lft are smaller than soc, and 
;;    3. all ssn numbers in rgt are larger than soc.

;; search-bst : number binary-tree -> false or 
;; returns true if a-n is in a-bt, and false if not.
(define (search-bt a-n a-bt)
  (cond
    [(boolean? a-bt) #f]
    [else 
     (cond
       [(= (node-ssn a-bt) a-n)
        (node-name a-bt)]
       [(< (node-ssn a-bt) a-n)
        (search-bt a-n (node-right a-bt))]
       [(> (node-ssn a-bt) a-n)
        (search-bt a-n (node-left a-bt))])]))

;; EXAMPLES as tests

(search-bt 1 false)
"should be" 
false

(search-bt 1 (make-node 2 'x false false))
"should be"
false

(search-bt 2 (make-node 2 'x false false))
"should be" 
'x

(search-bt 1 
             (make-node 2 
                        'x
                        (make-node 1 'y false false)
                        (make-node 3 'z false false)))
"should be" 
'y

(search-bt 3
             (make-node 2 
                        'x 
                        (make-node 1 'y false false)
                        (make-node 3 'z false false)))
"should be" 
'z


#|

Like search-sorted, once we examine the value
at a point in the data structure, we know that
what we search for can only be in a certain
place and we can "short-circut" the search.

|#