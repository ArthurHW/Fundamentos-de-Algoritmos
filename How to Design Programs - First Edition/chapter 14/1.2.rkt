;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.2|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; A family-tree-node (short: ftn) is either
;;
;;   1. empty; or
;;   2. (make-child f m na da ec)
;;      where f and m are ftns, na
;;      and ec are symbols, and da is a number.
(define-struct child (father mother name date eyes))

;; Oldest Generation:
(define Carl (make-child empty empty 'Carl 1926 'green))
(define Bettina (make-child empty empty 'Bettina 1926 'green))

;; Middle Generation: 
(define Adam (make-child Carl Bettina 'Adam 1950 'yellow))
(define Dave (make-child Carl Bettina 'Dave 1955 'black))
(define Eva (make-child Carl Bettina 'Eva 1965 'blue))
(define Fred (make-child empty empty 'Fred 1966 'pink))

;; Youngest Generation: 
(define Gustav (make-child Fred Eva 'Gustav 1988 'brown))

;; blue-eyed-ancestor? : ftn -> boolean
;; to determine whether a-ftree contains a child
;; structure with 'blue in the eyes field 
;; version 2: using an or-expression 
(define (blue-eyed-ancestor? a-ftree) 
  (cond 
    [(empty? a-ftree) false]
    [else (or (symbol=? (child-eyes a-ftree) 'blue) 
              (or (blue-eyed-ancestor? (child-father a-ftree))
                  (blue-eyed-ancestor? (child-mother a-ftree))))]))


(blue-eyed-ancestor? empty)
"should be"
(cond 
  [(empty? empty) false]
  [else (or (symbol=? (child-eyes empty) 'blue)
            (or (blue-eyed-ancestor? (child-father empty))
                (blue-eyed-ancestor? (child-mother empty))))])
"should be"
(cond 
  [true false]
  [else (or (symbol=? (child-eyes empty) 'blue)
            (or (blue-eyed-ancestor? (child-father empty))
                (blue-eyed-ancestor? (child-mother empty))))])
"should be"
false

(blue-eyed-ancestor? Gustav)
"should be"
(blue-eyed-ancestor?
 (make-child Fred Eva 'Gustav 1988 'brown))
"should be"
(blue-eyed-ancestor?
 (make-child (make-child empty empty 'Fred 1966 'pink)
             Eva
             'Gustav
             1988
             'brown))
"should be"
(blue-eyed-ancestor?
 (make-child (make-child empty empty 'Fred 1966 'pink)
             (make-child Carl Bettina 'Eva 1965 'blue)
             'Gustav
             1988
             'brown))
"should be"
(blue-eyed-ancestor?
 (make-child (make-child empty empty 'Fred 1966 'pink)
             (make-child (make-child empty empty 'Carl 1926 'green) 
                         Bettina
                         'Eva
                         1965
                         'blue)
             'Gustav
             1988
             'brown))
"should be"
(blue-eyed-ancestor?
 (make-child (make-child empty empty 'Fred 1966 'pink)
             (make-child (make-child empty empty 'Carl 1926 'green) 
                         (make-child empty empty 'Bettina 1926 'green)
                         'Eva
                         1965
                         'blue)
             'Gustav
             1988
             'brown))
"should be"
(or (blue-eyed-ancestor? (make-child empty empty 'Fred 1966 'pink))
    (blue-eyed-ancestor? (make-child (make-child empty empty 'Carl 1926 'green) 
                                     (make-child empty empty 'Bettina 1926 'green)
                                     'Eva
                                     1965
                                     'blue)))
"should be"
(or (or (blue-eyed-ancestor? empty)
        (blue-eyed-ancestor? empty))
    (blue-eyed-ancestor? (make-child (make-child empty empty 'Carl 1926 'green) 
                                     (make-child empty empty 'Bettina 1926 'green)
                                     'Eva
                                     1965
                                     'blue)))
"should be"
(or (or false
        (blue-eyed-ancestor? empty))
    (blue-eyed-ancestor? (make-child (make-child empty empty 'Carl 1926 'green) 
                                     (make-child empty empty 'Bettina 1926 'green)
                                     'Eva
                                     1965
                                     'blue)))
(or (blue-eyed-ancestor? empty)
    (blue-eyed-ancestor? (make-child (make-child empty empty 'Carl 1926 'green) 
                                     (make-child empty empty 'Bettina 1926 'green)
                                     'Eva
                                     1965
                                     'blue)))
"should be"
(or false
    (blue-eyed-ancestor? (make-child (make-child empty empty 'Carl 1926 'green) 
                                     (make-child empty empty 'Bettina 1926 'green)
                                     'Eva
                                     1965
                                     'blue)))
"should be"
(blue-eyed-ancestor? (make-child (make-child empty empty 'Carl 1926 'green) 
                                 (make-child empty empty 'Bettina 1926 'green)
                                 'Eva
                                 1965
                                 'blue))
"should be"
true