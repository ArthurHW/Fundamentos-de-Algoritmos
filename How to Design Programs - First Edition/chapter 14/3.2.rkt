;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.1|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; DATA DEFINITIONS
; a web-page is either: 
;   1. empty
;   2. (cons S WP) where S is a symbol and WP is a web-page
;   3. (cons EWP WP) where EWP and WP are web-pages

; TEMPLATE
;(define (fun-for-webpage wp)
;  (cond
;    [(empty? wp) ...]
;    [(symbol? (first wp)) 
;     (... (first wp) ... (fun-for-webpage (rest wp)) ...)]
;    [else
;     (... (fun-for-webpage (first wp)) ...
;          (fun-for-webpage (rest wep)) ...)]))

; EXAMPLES
; (occurs1 empty 'a) => 0
; (occurs1 '(a b a) 'a) => 2
; (occurs1 '((a b c) b (a a a) a) 'a) => 1

; Contract/purpose/header:
; occurs1: web-page symbol -> number
; to count the occurences of the given symbol in the given web-page, ignoring
; embedded web pages
(define (occurs1 wp s)
  (cond
    [(empty? wp) 0]
    [(symbol? (first wp))
     (cond
       [(symbol=? (first wp) s) (+ 1 (occurs1 (rest wp) s))]
       [else (occurs1 (rest wp) s)])]
    [else (occurs1 (rest wp) s)]))

"occurs1 tests"
(= (occurs1 empty 'a) 0)
(= (occurs1 '(a b a) 'a) 2)
(= (occurs1 '((a b c) b (a a a) a) 'a) 1)


; occurs2: web-page symbol -> number
; to count the occurences of the given symbol in the given web page, including
; embedded web pages

; examples:
; (occurs1 empty 'a) => 0
; (occurs1 '(a b a) 'a) => 2
; (occurs1 '((a b c) b (a a a) a) 'a) => 5
(define (occurs2 wp s)
  (cond
    [(empty? wp) 0]
    [(symbol? (first wp))
     (cond
       [(symbol=? (first wp) s) (+ 1 (occurs2 (rest wp) s))]
       [else (occurs2 (rest wp) s)])]
    [else (+ (occurs2 (first wp) s) (occurs2 (rest wp) s))]))

"occurs2 tests"
(= (occurs2 empty 'a) 0)
(= (occurs2 '(a b a) 'a) 2)
(= (occurs2 '((a b c) b (a a a) a) 'a) 5)