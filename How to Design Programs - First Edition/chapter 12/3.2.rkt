;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |3.2|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; draw-polygon : polygon -> true
;; to draw the polygon specified by a-poly  
(define (draw-polygon a-poly) 
  (connect-dots a-poly (first a-poly))) 

;; connect-dots : polygon a-posn -> true 
;; to draw connections between the dots of a-poly 
;; and to connect the last posn in a-poly to a-posn
(define (connect-dots a-poly a-posn) 
  (cond 
    [(empty? (rest a-poly)) 
     (draw-solid-line (first a-poly) a-posn 'red)] 
    [else (and (draw-solid-line (first a-poly)
                                (second a-poly)
                                'red) 
               (connect-dots (rest a-poly) a-posn))]))

;; EXAMPLES AS TESTS
(start 200 200)

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