;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; 1.
(check-expect (> 4 3) #true)
(check-expect (> 2 3) #false)
(check-expect (> 7/2 3) #true)

;; 2.
(check-expect (and (> 4 3) (> 3 3)) #false)
(check-expect (and (> 4 2) (> 2 3)) #false)
(check-expect (and (> 4 7/2) (> 7/2 3)) #true)

;; 3.
(check-expect (= (* 4 4) 4) #false)
(check-expect (= (* 2 2) 2) #false)
(check-expect (= (* 7/2 7/2) 7/2) #false)