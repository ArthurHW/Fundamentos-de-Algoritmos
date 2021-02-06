;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.3|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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
; (replace 'new 'old empty) => empty
; (replace 'new 'old '(other)) => (list 'other)
; (replace 'new 'old '(old)) => (list 'new)
; (replace 'new 'old '((new old other) other old old)) 
; => 
; (list (list 'new 'new 'other) 'other 'new 'new)

; CONTRACT/PURPOSE/HEADERS
; replace : symbol symbol webpage -> webpage
; to produce a webpage identical to the given web page except that all 
; occurences the second symbol are replaced with the first. 
(define (replace new old wp)
  (cond
    [(empty? wp) empty]
    [(symbol? (first wp)) 
     (cond
       [(symbol=? (first wp) old)
        (cons new (replace new old (rest wp)))]
       [else (cons (first wp) (replace new old (rest wp)))])]
    [else
     (cons (replace new old (first wp)) (replace new old (rest wp)))]))

(equal? (replace 'new 'old empty) empty)
(equal? (replace 'new 'old '(other)) (list 'other))
(equal? (replace 'new 'old '(old)) (list 'new))
(equal? (replace 'new 'old '((new old other) other old old))
        (list (list 'new 'new 'other) 'other 'new 'new))