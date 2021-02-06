;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; eliminate-exp : number list-of-numbers -> list-of-numbers
;; eliminates expensive prices from the list of numbers. A
;; price is expensive if it is more than ua.

#|
;; Template
(define (eliminate-exp ua lotp)
  (cond
    [(empty? lotp) ...]
    [else ... (first lotp) ...
          ... (eliminate-exp ua (rest lotp)) ...]))
|#

(define (eliminate-exp ua lotp)
  (cond
    [(empty? lotp) empty]
    [else (cond
            [(<= (first lotp) ua)
             (cons (first lotp)
                   (eliminate-exp ua (rest lotp)))]
            [else
             (eliminate-exp ua (rest lotp))])]))

;; Examples
(eliminate-exp 1.0 empty) "should be" empty
(eliminate-exp 1.0 (cons 1.0 empty)) "should be" (cons 1.0 empty)
(eliminate-exp 1.0 (cons 1.2 empty)) "should be" empty
(eliminate-exp 1.0 (cons 2.95 (cons .95 (cons 1.0 (cons 5 empty))))) "should be"
(cons .95 (cons 1.0 empty))