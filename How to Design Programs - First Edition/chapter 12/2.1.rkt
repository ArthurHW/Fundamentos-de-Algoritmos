;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |2.1|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; A mail-message is a structure: 
;;    (make-mail name n s) 
;; where name is a string, n is a number, and s is a string.
(define-struct mail (from date message))

;; A list-of-mail-messages is either:
;;  - empty, or
;;  - (cons mail-message list-of-mail-messages)

;; sort-by-date : list-of-mail-messages -> list-of-mail-messages
;; to sort the list of mail messages by date
(define (sort-by-date a-lomm)
  (cond
    [(empty? a-lomm) empty]
    [else (insert-by-date (first a-lomm)
                          (sort-by-date (rest a-lomm)))]))

;; insert : mail-message list-of-mail-messages -> list-of-mail-messages
;; to insert mm into the proper place in a-lomm,
;; assuming that a-lomm is sorted
(define (insert-by-date mm a-lomm)
  (cond
    [(empty? a-lomm) (cons mm empty)]
    [else (cond
            [(< (mail-date mm) (mail-date (first a-lomm)))
             (cons mm a-lomm)]
            [else
             (cons (first a-lomm)
                   (insert-by-date mm (rest a-lomm)))])]))

;; EXAMPLES AS TESTS

(insert-by-date
 (make-mail "Tim" 1911 "hi")
 empty)
"should be"
(cons (make-mail "Tim" 1911 "hi") empty)

(insert-by-date
 (make-mail "Pola" 1911 "Chocolate")
 (cons
  (make-mail "Neo" 1900 "Vanilla")
  (cons
   (make-mail "Tin" 1922 "Strawberry")
   empty)))
"should be"
(cons
 (make-mail "Neo" 1900 "Vanilla")
 (cons
  (make-mail "Pola" 1911 "Chocolate")
  (cons
   (make-mail "Tin" 1922 "Strawberry")
   empty)))

(define example-list-of-mail-messages
  (cons
   (make-mail "Ronnie" 1980 "Don't forget my number!")
   (cons
    (make-mail "Richard" 1960 "I am not a crook")
    (cons
     (make-mail "George" 1990 "No new taxes")
     empty))))

(sort-by-date empty) "should be" empty
(sort-by-date example-list-of-mail-messages)
"should be"
(cons
 (make-mail "Richard" 1960 "I am not a crook")
 (cons
  (make-mail "Ronnie" 1980 "Don't forget my number!")
  (cons
   (make-mail "George" 1990 "No new taxes")
   empty)))

;; sort-by-name : list-of-mail-messages -> list-of-mail-messages
;; to sort the list of mail messages by date
(define (sort-by-name a-lomm)
  (cond
    [(empty? a-lomm) empty]
    [else (insert-by-name (first a-lomm)
                          (sort-by-name (rest a-lomm)))]))

;; insert : mail-message list-of-mail-messages -> list-of-mail-messages
;; to insert mm into the proper place in a-lomm,
;; assuming that a-lomm is sorted
(define (insert-by-name mm a-lomm)
  (cond
    [(empty? a-lomm) (cons mm empty)]
    [else (cond
            [(string<? (mail-from mm) (mail-from (first a-lomm)))
             (cons mm a-lomm)]
            [else
             (cons (first a-lomm)
                   (insert-by-name mm (rest a-lomm)))])]))

;; EXAMPLES AS TESTS
(insert-by-name
 (make-mail "Tim" 1911 "hi")
 empty)
"should be"
(cons (make-mail "Tim" 1911 "hi") empty)

(insert-by-name
 (make-mail "Pola" 1911 "Chocolate")
 (cons
  (make-mail "Neo" 1900 "Vanilla")
  (cons
   (make-mail "Tin" 1922 "Strawberry")
   empty)))
"should be"
(cons
 (make-mail "Neo" 1900 "Vanilla")
 (cons
  (make-mail "Pola" 1911 "Chocolate")
  (cons
   (make-mail "Tin" 1922 "Strawberry")
   empty)))

(sort-by-name empty) "should be" empty
(sort-by-name example-list-of-mail-messages)
"should be"
(cons
 (make-mail "George" 1990 "No new taxes")
 (cons
  (make-mail "Richard" 1960 "I am not a crook")
  (cons
   (make-mail "Ronnie" 1980 "Don't forget my number!")
   empty)))