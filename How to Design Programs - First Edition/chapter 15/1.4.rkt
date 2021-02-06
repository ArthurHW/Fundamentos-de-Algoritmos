;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.4|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; Language: Intermediate Student

;; STRUCTURE DEFINITION: parent

(define-struct parent (c name dob eyes))

;; DATA DEFINITIONS
;; ----------------
;;  parent
;;  list-of-children
;; -----------------
;; A parent is a structure
;;
;;  (make-parent c name dob eyes)
;;
;; where c is a list of children, name and eyes are symbols, and dob is a number.
;; ------------------------------------------------------------------------------
;; A list-of-children is either
;;
;;  empty, or
;;  (cons p c)
;;
;; where p is a parent and c is a list of children.
;; ------------------------------------------------

;; VARIABLE DEFINITIONS
;; --------------------
(define Jango (make-parent empty 'Jango 2010 'blue))

(define Jennifer-Gustav (list Jango))

(define Jennifer (make-parent Jennifer-Gustav 'Jennifer 1988 'purple))
(define Gustav (make-parent Jennifer-Gustav 'Gustav 1988 'brown))

(define Fred-Eva (list Gustav))
(define Fred (make-parent Fred-Eva 'Fred 1965 'pink))

(define Eva (make-parent Fred-Eva 'Eva 1965 'blue))
(define Dave (make-parent empty 'Dave 1955 'black))
(define Adam (make-parent empty 'Adam 1950 'yellow))

(define Carl-Bettina (list Adam Dave Eva))

(define Carl (make-parent Carl-Bettina 'Carl 1926 'green))
(define Bettina (make-parent Carl-Bettina 'Bettina 1926 'green))

;; eye-colors : parent -> list
;; consumes a parent p
;; produces a list of p's eye color and the eye color of each
;; parent that is descended from p (children)
(define (eye-colors p)
  (cons (parent-eyes p) (children-eye-colors (parent-c p))))

;; children-eye-colors : list-of-children -> list
;; consumes a list-of-children c
;; produces a list of the eye-colors of the parents in c
;; and their descendants
(define (children-eye-colors c)
  (cond
    [(empty? c) empty]
    [else (append (eye-colors (first c)) (children-eye-colors (rest c)))]))

;; EXAMPLES AS TESTS
(check-expect (eye-colors Jango)
              (list 'blue))
(check-expect (children-eye-colors empty)
              empty)
(check-expect (children-eye-colors (list Jango))
              (list 'blue))
(check-expect (eye-colors Gustav)
              (list 'brown 'blue))
(check-expect (eye-colors Bettina) 
              (list 'green 'yellow 'black 'blue 'brown 'blue))
