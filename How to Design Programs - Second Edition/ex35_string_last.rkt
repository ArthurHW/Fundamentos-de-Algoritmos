;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex35_string_last) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; string -> character
; Extracts the last character from a non-empty string
; given: "hello", expect: "o"
; given: "please", expect: "e"
(define (string-last string)
  (substring string (last-character string)))


; string -> number
; Returns the number of the position of the last character of a string
; given: "hello world", expect: 10
(define (last-character string)
  (- (string-length string) 1))
