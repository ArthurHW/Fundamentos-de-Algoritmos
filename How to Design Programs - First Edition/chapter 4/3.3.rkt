;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; (a)
(define n1 500)

(cond
  [(<= n1 1000) (* .040 1000)]
  [(<= n1 5000) (+ (* 1000 .040) 
                  (* (- n1 1000) .045))]
  [else (+ (* 1000 .040) 
           (* 4000 .045)
           (* (- n1 10000) .055))])
"should be"
40

;; (b)

(define n2 2800)
(cond
  [(<= n2 1000) (* .040 1000)]
  [(<= n2 5000) (+ (* 1000 .040) 
                  (* (- n2 1000) .045))]
  [else (+ (* 1000 .040) 
           (* 4000 .045)
           (* (- n2 10000) .055))])
"should be"
121

;; (c)
(define n3 15000)
(cond
  [(<= n3 1000) (* .040 1000)]
  [(<= n3 5000) (+ (* 1000 .040) 
                  (* (- n3 1000) .045))]
  [else (+ (* 1000 .040) 
           (* 4000 .045)
           (* (- n3 10000) .055))])
"should be"
495