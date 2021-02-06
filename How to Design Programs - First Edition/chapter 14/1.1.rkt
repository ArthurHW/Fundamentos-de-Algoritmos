;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.1|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; an ftn is either:
;;  - empty, or
;;  - (make-ftn f m na da ec)
;;    where f and m are ftns,
;;          na and ec are symbols,
;;      and da is a number.
(define-struct child (father mother name date eyes))

;; Carl : ftn
;; an example family tree node
(define Carl (make-child empty empty 'Carl 1926 'green))

;; blue-eyed-ancestor1? : ftn -> boolean
;; to determine if there is a blue-eyed ancestor in a-ftn
(define (blue-eyed-ancestor1? a-ftn)
  (cond
    [(empty? a-ftn) false]
    [else
     (cond
       [(symbol=? (child-eyes a-ftn) 'blue) true]
       [(blue-eyed-ancestor1? (child-father a-ftn)) true]
       [(blue-eyed-ancestor1? (child-mother a-ftn)) true]
       [else false])]))

;; blue-eyed-ancestor1? : ftn -> boolean
;; to determine if there is a blue-eyed ancestor in a-ftn
(define (blue-eyed-ancestor2? a-ftn)
  (cond
    [(empty? a-ftn) false]
    [else
     (or (symbol=? (child-eyes a-ftn) 'blue)
         (blue-eyed-ancestor2? (child-father a-ftn))
         (blue-eyed-ancestor2? (child-mother a-ftn)))]))


(blue-eyed-ancestor1? empty) 
"should be" 
(cond
  [(empty? empty) false]
  [else
   (cond
     [(symbol=? (child-eyes empty) 'blue) true]
     [(blue-eyed-ancestor1? (child-father empty)) true]
     [(blue-eyed-ancestor1? (child-mother empty)) true]
     [else false])])
"should be"
(cond
  [true false]
  [else
   (cond
     [(symbol=? (child-eyes empty) 'blue) true]
     [(blue-eyed-ancestor1? (child-father empty)) true]
     [(blue-eyed-ancestor1? (child-mother empty)) true]
     [else false])])
"should be"
false

(blue-eyed-ancestor2? empty)
"should be"
(cond
  [(empty? empty) false]
  [else
   (or (symbol=? (child-eyes empty) 'blue)
       (blue-eyed-ancestor2? (child-father empty))
       (blue-eyed-ancestor2? (child-mother empty)))])
"should be"
(cond
  [true false]
  [else
   (or (symbol=? (child-eyes empty) 'blue)
       (blue-eyed-ancestor2? (child-father empty))
       (blue-eyed-ancestor2? (child-mother empty)))])
"should be"
false

(blue-eyed-ancestor1? Carl)
"should be"
(blue-eyed-ancestor1? (make-child empty empty 'Carl 1926 'green))
"should be"
(cond
  [(empty? (make-child empty empty 'Carl 1926 'green)) false]
  [else
   (cond
     [(symbol=? (child-eyes (make-child empty empty 'Carl 1926 'green)) 'blue) true]
     [(blue-eyed-ancestor1? (child-father (make-child empty empty 'Carl 1926 'green))) true]
     [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
     [else false])])
"should be"
(cond
  [false false]
  [else
   (cond
     [(symbol=? (child-eyes (make-child empty empty 'Carl 1926 'green)) 'blue) true]
     [(blue-eyed-ancestor1? (child-father (make-child empty empty 'Carl 1926 'green))) true]
     [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
     [else false])])
"should be"
(cond
  [else
   (cond
     [(symbol=? (child-eyes (make-child empty empty 'Carl 1926 'green)) 'blue) true]
     [(blue-eyed-ancestor1? (child-father (make-child empty empty 'Carl 1926 'green))) true]
     [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
     [else false])])
"should be"
(cond
  [(symbol=? (child-eyes (make-child empty empty 'Carl 1926 'green)) 'blue) true]
  [(blue-eyed-ancestor1? (child-father (make-child empty empty 'Carl 1926 'green))) true]
  [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
  [else false])
"should be"
(cond
  [(symbol=? 'green 'blue) true]
  [(blue-eyed-ancestor1? (child-father (make-child empty empty 'Carl 1926 'green))) true]
  [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
  [else false])
"should be"
(cond
  [false true]
  [(blue-eyed-ancestor1? (child-father (make-child empty empty 'Carl 1926 'green))) true]
  [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
  [else false])
"should be"
(cond
  [(blue-eyed-ancestor1? (child-father (make-child empty empty 'Carl 1926 'green))) true]
  [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
  [else false])
"should be"
(cond
  [(blue-eyed-ancestor1? (child-father (make-child empty empty 'Carl 1926 'green))) true]
  [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
  [else false])
"should be"
(cond
  [(blue-eyed-ancestor1? empty) true]
  [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
  [else false])
"should be"
(cond
  [(cond
     [(empty? empty) false]
     [else
      (cond
        [(symbol=? (child-eyes empty) 'blue) true]
        [(blue-eyed-ancestor1? (child-father empty)) true]
        [(blue-eyed-ancestor1? (child-mother empty)) true]
        [else false])])
   true]
  [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
  [else false])
"should be"
(cond
  [(cond
     [true false]
     [else
      (cond
        [(symbol=? (child-eyes empty) 'blue) true]
        [(blue-eyed-ancestor1? (child-father empty)) true]
        [(blue-eyed-ancestor1? (child-mother empty)) true]
        [else false])])
   true]
  [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
  [else false])
"should be"
(cond
  [false true]
  [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
  [else false])
"should be"
(cond
  [(blue-eyed-ancestor1? (child-mother (make-child empty empty 'Carl 1926 'green))) true]
  [else false])
"should be"
(cond
  [(cond
     [(empty? empty) false]
     [else
      (cond
        [(symbol=? (child-eyes empty) 'blue) true]
        [(blue-eyed-ancestor1? (child-father empty)) true]
        [(blue-eyed-ancestor1? (child-mother empty)) true]
        [else false])])
   true]
  [else false])
"should be"
(cond
  [(cond
     [true false]
     [else
      (cond
        [(symbol=? (child-eyes empty) 'blue) true]
        [(blue-eyed-ancestor1? (child-father empty)) true]
        [(blue-eyed-ancestor1? (child-mother empty)) true]
        [else false])])
   true]
  [else false])
"should be"
(cond
  [false true]
  [else false])
"should be"
(cond
  [else false])
"should be"
false

(blue-eyed-ancestor2? Carl)
"should be"
(blue-eyed-ancestor2? (make-child empty empty 'Carl 1926 'green))
"should be"
(cond
  [(empty? (make-child empty empty 'Carl 1926 'green)) false]
  [else
   (or (symbol=? (child-eyes (make-child empty empty 'Carl 1926 'green)) 'blue)
       (blue-eyed-ancestor2? (child-father (make-child empty empty 'Carl 1926 'green)))
       (blue-eyed-ancestor2? (child-mother (make-child empty empty 'Carl 1926 'green))))])
"should be"
(cond
  [false false]
  [else
   (or (symbol=? (child-eyes (make-child empty empty 'Carl 1926 'green)) 'blue)
       (blue-eyed-ancestor2? (child-father (make-child empty empty 'Carl 1926 'green)))
       (blue-eyed-ancestor2? (child-mother (make-child empty empty 'Carl 1926 'green))))])
"should be"
(cond
  [else
   (or (symbol=? (child-eyes (make-child empty empty 'Carl 1926 'green)) 'blue)
       (blue-eyed-ancestor2? (child-father (make-child empty empty 'Carl 1926 'green)))
       (blue-eyed-ancestor2? (child-mother (make-child empty empty 'Carl 1926 'green))))])
"should be"
(or (symbol=? (child-eyes (make-child empty empty 'Carl 1926 'green)) 'blue)
    (blue-eyed-ancestor2? (child-father (make-child empty empty 'Carl 1926 'green)))
    (blue-eyed-ancestor2? (child-mother (make-child empty empty 'Carl 1926 'green))))
"should be"
(or (symbol=? 'green 'blue)
    (blue-eyed-ancestor2? (child-father (make-child empty empty 'Carl 1926 'green)))
    (blue-eyed-ancestor2? (child-mother (make-child empty empty 'Carl 1926 'green))))
"should be"
(or false
    (blue-eyed-ancestor2? (child-father (make-child empty empty 'Carl 1926 'green)))
    (blue-eyed-ancestor2? (child-mother (make-child empty empty 'Carl 1926 'green))))
"should be"
(or (blue-eyed-ancestor2? (child-father (make-child empty empty 'Carl 1926 'green)))
    (blue-eyed-ancestor2? (child-mother (make-child empty empty 'Carl 1926 'green))))
"should be"
(or (blue-eyed-ancestor2? empty)
    (blue-eyed-ancestor2? (child-mother (make-child empty empty 'Carl 1926 'green))))
"should be"
(or (cond
      [(empty? empty) false]
      [else
       (or (symbol=? (child-eyes empty) 'blue)
           (blue-eyed-ancestor2? (child-father empty))
           (blue-eyed-ancestor2? (child-mother empty)))])
    (blue-eyed-ancestor2? (child-mother (make-child empty empty 'Carl 1926 'green))))
"should be"
(or (cond
      [true false]
      [else
       (or (symbol=? (child-eyes empty) 'blue)
           (blue-eyed-ancestor2? (child-father empty))
           (blue-eyed-ancestor2? (child-mother empty)))])
    (blue-eyed-ancestor2? (child-mother (make-child empty empty 'Carl 1926 'green))))
"should be"
(or false
    (blue-eyed-ancestor2? (child-mother (make-child empty empty 'Carl 1926 'green))))
"should be"
(or false (blue-eyed-ancestor2? (child-mother (make-child empty empty 'Carl 1926 'green))))
"should be"
(or false (blue-eyed-ancestor2? empty))
"should be"
(or false
    (cond
      [(empty? empty) false]
      [else
       (or (symbol=? (child-eyes empty) 'blue)
           (blue-eyed-ancestor2? (child-father empty))
           (blue-eyed-ancestor2? (child-mother empty)))]))
"should be"
(or false
    (cond
      [true false]
      [else
       (or (symbol=? (child-eyes empty) 'blue)
           (blue-eyed-ancestor2? (child-father empty))
           (blue-eyed-ancestor2? (child-mother empty)))]))
"should be"
(or false false)
"should be"
false