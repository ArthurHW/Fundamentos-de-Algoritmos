;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.2|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct node (ssn name left right))

;; A binary tree is either
;;   1. false or 
;;   2. (make-node soc pn lft rgt) 
;;         where soc is a number, pn is a symbol,
;;         and lft and rgt are bts. 


;; search-bt : number binary-tree -> false or 
;; returns true if a-n is in a-bt, and false if not.
(define (search-bt a-n a-bt)
  (cond
    [(boolean? a-bt) #f]
    [else 
     (cond
       [(= (node-ssn a-bt) a-n)
        (node-name a-bt)]
       [(boolean? (search-bt a-n (node-left a-bt)))
        (search-bt a-n (node-right a-bt))]
       [else
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

(search-bt 2 
             (make-node 1 
                        'x
                        (make-node 2 'y false false)
                        (make-node 3 'z false false)))
"should be" 
'y

(search-bt 3
             (make-node 1 
                        'x 
                        (make-node 2 'y false false)
                        (make-node 3 'z false false)))
"should be" 
'z