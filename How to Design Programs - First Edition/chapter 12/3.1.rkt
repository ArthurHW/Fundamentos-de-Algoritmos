;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |3.1|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; draw-polygon : polygon -> true
;; to draw the polygon specified by a-poly  
(define (draw-polygon a-poly) 
  (connect-dots (add-at-end a-poly (first a-poly)))) 

;; connect-dots : polygon -> true 
;; to draw connections between the dots of a-poly 
(define (connect-dots a-poly) 
  (cond 
    [(empty? (rest a-poly)) true] 
    [else (and (draw-solid-line (first a-poly)
                                (second a-poly)
                                'red) 
               (connect-dots (rest a-poly)))]))

;; add-at-end : polygon posn -> polygon 
;; to add a-posn to the end of a-poly
(define (add-at-end a-poly a-posn) 
  (cond 
    [(empty? a-poly) (cons a-posn empty)] 
    [else (cons (first a-poly) (add-at-end (rest a-poly) a-posn))])) 

;; EXAMPLES AS TESTS
(start 200 200)

(add-at-end empty (make-posn 0 0)) "should be" (cons (make-posn 0 0) empty)
(add-at-end (cons (make-posn 0 0) empty)
            (make-posn 1 1))
"should be"
(cons (make-posn 0 0) (cons (make-posn 1 1) empty))

(define example-polygon
  (cons
   (make-posn 10 10)
   (cons
    (make-posn 90 100)
    (cons
     (make-posn 10 190)
     (cons
      (make-posn 190 190)
      (cons
       (make-posn 110 100)
       (cons
        (make-posn 190 10)
        empty)))))))

(draw-polygon example-polygon)