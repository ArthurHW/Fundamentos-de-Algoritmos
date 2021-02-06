;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; A jet-fighter is a structure:
;;  (make-jet-fighter symbol number number number)
(define-struct jet-fighter (designation acceleration top-speed range))

;; within-range : jet-fighter number -> boolean
;; to determine if jf can go distance d
(define (within-range jf d)
  (<= d (jet-fighter-range jf)))

;; EXAMPLES
(within-range (make-jet-fighter 'f22 4 1000 600) 400)
"should be" true
(within-range (make-jet-fighter 'mig22 10 800 300) 400)
"should be" false

;; reduce-range : jet-fighter -> jet-fighter
;; to return a jet-fighter whose range is 80% of jf's.
(define (reduce-range jf)
  (make-jet-fighter
   (jet-fighter-designation jf)
   (jet-fighter-acceleration jf)
   (jet-fighter-top-speed jf)
   (* .8 (jet-fighter-range jf))))

;; EXAMPLE
(reduce-range
 (make-jet-fighter 'f22 4 1000 600))
"should be"
(make-jet-fighter 'f22 4 1000 480)