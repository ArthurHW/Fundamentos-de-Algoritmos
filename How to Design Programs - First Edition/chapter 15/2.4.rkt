;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.4|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; Language: Intermediate Student
;; Teachpack: testing.ss

;; Data Definitions

(define-struct wp (header body))
;; A Web-page (short: WP) is a structure:
;;   (make-wp h p) 
;; where h is a symbol and p is a (Web) document.

;; A (Web) document is either:
;; 1. empty
;; 2. (cons s p)  where s is a symbol and p is a (Web) document
;; 3. (cons wp p)  where wp is a web-page and p is a document

;; A list-of-symbols is either:
;; 1. empty
;; 2. (cons symbol list-of-symbols)

;; A los-or-false is either:
;; 1. false
;; 2. list-of-symbols

;; find : wp symbol -> los-or-false
(define (find a-wp a-word)
  (append-or-false (list (wp-header a-wp))
                   (find-in-document (wp-body a-wp) a-word)))

;; find-in-body : document symbol -> los-or-false
(define (find-in-document a-page a-word)
  (cond
    [(empty? a-page) false]
    [(symbol? (first a-page)) (cond 
                                [(symbol=? (first a-page) a-word) empty]  
                                [else (find-in-document (rest a-page) a-word)])]
    [else (local ((define in-subpage (find (first a-page) a-word)))
            (cond
              [(boolean? in-subpage) (find-in-document (rest a-page) a-word)]
              [else in-subpage]))]))


;; append-or-false : list-of-symbols los-or-false -> los-or-false
;; appends y to x if y is not false
(define (append-or-false x y)
  (cond
    [(boolean? y) y]
    [else (append x y)]))

;; --- test code

;; data examples:
(define empty-page (make-wp 'empty-page empty))
(define page-1-word (make-wp 'page-1-word (cons 'w1 empty)))
(define page-2-words (make-wp 'page-2-words (list 'w1 'w2)))
(define with-1-word-subpage (make-wp 'page-1-word-with-subpage (cons page-1-word empty)))
(define with-2-words-subpage (make-wp 'with-2-words-subpage (cons page-2-words empty)))
(define dense-page1 (make-wp 'realistic (list 'w3  page-2-words 'w4 page-1-word 'w5)))
(define dense-page2 (make-wp 'realistic (list 'w3  empty-page 'w4 with-1-word-subpage 'w5)))

;; test cases

; test for 'append-or-false'
(check-expect (append-or-false empty false) false)
(check-expect (append-or-false empty empty) empty)
(check-expect (append-or-false (list 'a) false) false)
(check-expect (append-or-false (list 'a) empty) (list 'a))
(check-expect (append-or-false (list 'a) (list 'b)) (list 'a 'b))

;; test for 'find'
(check-expect (find empty-page 'w1) false)
(check-expect (find page-1-word 'w1) (list 'page-1-word))
(check-expect (find page-2-words 'w3) false)
(check-expect (find with-2-words-subpage 'w2) (list 'with-2-words-subpage 'page-2-words))
(check-expect (find dense-page1 'no-in-there) false)
(check-expect (find dense-page1 'w1) (list 'realistic 'page-2-words))
(check-expect (find dense-page1 'w2) (list 'realistic 'page-2-words))
(check-expect (find dense-page2 'w1) (list 'realistic 'page-1-word-with-subpage 'page-1-word))
(check-expect (find dense-page1 'w5) (list 'realistic))

(generate-report)
;; --- end test code