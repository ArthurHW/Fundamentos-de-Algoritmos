;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.3|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
#|

A scheme-expression is either:

  - number,
  - symbol,
  - (make-add scheme-expression scheme-expression)
  - (make-mul scheme-expression scheme-expression)

|#

(define-struct add (lhs rhs))
(define-struct mul (lhs rhs))

;; EXAMPLES

;; 1. (+ 10 -10) 
(make-add 10 -10)

;; 2. (+ (* 20 3) 33) 
(make-add (make-mul 20 3) 33)

;; 3. (* 3.14 (* r r)) 
(make-mul 3.14 (make-mul 'r 'r))

;; 4. (+ (* 9/5 c) 32) 
(make-add (make-mul 9/5 'c) 32)

;; 5. (+ (* 3.14 (* o o)) (* 3.14 (* i i)))���
(make-add (make-mul 3.14 (make-mul 'o 'o))
          (make-mul 3.14 (make-mul 'i 'i)))

; -------------------------------------------------------------------------

;; numeric? : scheme-expression -> boolean
;; deteremines if the expression is numeric or not

(define (numeric? a-se)
  (cond
    [(number? a-se) true]
    [(symbol? a-se) false]
    [(add? a-se) (and (numeric? (add-lhs a-se))
                      (numeric? (add-rhs a-se)))]
    [(mul? a-se) (and (numeric? (mul-lhs a-se))
                      (numeric? (mul-rhs a-se)))]))

;; EXAMPLES AS TESTS

(numeric? 1)
"should be"
true

(numeric? 'a)
"should be"
false

(numeric? (make-add 1 'a))
"should be"
false

(numeric? (make-add 1 2))
"should be"
true

(numeric? (make-mul 1 'a))
"should be"
false

(numeric? (make-mul 1 2))
"should be"
true

; -------------------------------------------------------------------------

#|

A numeric-expression is either:

  - number,
  - (make-add numeric-expression numeric-expression)
  - (make-mul numeric-expression numeric-expression)


|#

;; evaluate : scheme-expression -> number
;; to determine the value of a scheme expression
(define (evaluate-expression a-se)
  (cond
    [(number? a-se) a-se]
    [(symbol? a-se) (error 'evaluate-expression "got a variable")]
    [(add? a-se) (+ (evaluate-expression (add-lhs a-se))
                    (evaluate-expression (add-rhs a-se)))]
    [(mul? a-se) (* (evaluate-expression (mul-lhs a-se))
                    (evaluate-expression (mul-rhs a-se)))]))

;; EXAMPLES AS TESTS
(evaluate-expression 1)
"should be"
1

(evaluate-expression (make-add 1 2))
"should be"
3

(evaluate-expression (make-mul 4 2))
"should be"
8

(evaluate-expression (make-add (make-add 5 7) (make-mul 4 3)))
"should be"
24

; (evaluate-expression 'x)
; error!