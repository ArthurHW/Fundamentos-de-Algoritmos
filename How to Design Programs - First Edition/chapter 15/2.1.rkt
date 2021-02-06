;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.1|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; struct from WP data definition
(define-struct wp (header body))

;; EXAMPLE WEB PAGES
(define dogs-wp
  (make-wp 'dogs-wp 
           (list 'my 'dogs 'web 'page)))

(define cats-wp
  (make-wp 'cats-wp
           (list 'my 'cats 'web 'page)))

(define my-wp
  (make-wp 'my-wp
           (list 'see 'my 'dog dogs-wp
                 'see 'my 'cat cats-wp)))

;; size-wp : wp -> number
;; determines the number of words in a web page
(define (size a-wp)
  (size-document (wp-body a-wp)))

;; size-document : web-document -> number
;; determines the number of words in a web document
(define (size-document a-wd)
  (cond
    [(empty? a-wd) 0]
    [(symbol? (first a-wd)) (+ 1 (size-document (rest a-wd)))]
    [(wp? (first a-wd)) (size-document (rest a-wd))]))

;; EXAMPLES AS TESTS
(size dogs-wp) "should be" 4
(size cats-wp) "should be" 4
(size my-wp) "should be" 6