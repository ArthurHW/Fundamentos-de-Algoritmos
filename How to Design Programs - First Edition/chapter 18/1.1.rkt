;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |1.1|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
#|

;; 1.
(local ((define x (* y 3)))
  (* x x)) 

;; RED: x is the only locally defined variable
;; GREEN : (* y 3) is the right hand side for `x'
;; BLUE: (* x x) is the body of the local expression

;; 2.
(local ((define (odd an)
          (cond 
            [(zero? an) false] 
            [else (even (sub1 an))])) 
        (define (even an) 
          (cond 
            [(zero? an) true] 
            [else (odd (sub1 an))]))) 
  (even a-nat-num)) 

;;   RED: odd and even are the locally defined variables
;; GREEN: these are the right-hand sides:
   (cond 
     [(zero? an) false] 
     [else (even (sub1 an))])

and
   
   (cond 
     [(zero? an) true] 
     [else (odd (sub1 an))])
   
;;  BLUE: (even a-nat-num) is the body of the local expression

;; 3.
(local ((define (f x) (g x (+ x 1)))
        (define (g x y) (f (+ x y)))) 
  (+ (f 10) (g 10 20))) 

;;   RED: f and g are the locall defined variables
;; GREEN: (g x (+ x 1)) is the rhs of f and
;;        (f (+ x y)) is the rhs of g.
;;  BLUE: (+ (f 10) (g 10 20)) is the body of the local expression

|#