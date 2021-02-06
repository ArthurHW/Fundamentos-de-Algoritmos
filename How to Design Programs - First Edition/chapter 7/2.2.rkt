;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; A vehicle is either 
;;  - a bus 
;;  - a limo
;;  - a car 
;;  - a police car
;;  - a subway 

(define-struct bus (plate carries))
;; A bus is (make-bus symbol number). 

(define-struct limo (plate carries))
;; A limo is (make-limo symbol number). 

(define-struct auto (plate carries))
;; A car is (make-auto symbol number). 

(define-struct police-car (siren-on? carries))
;; A police-car is (make-police-car boolean number)

(define-struct subway (elevated? carries))
;; A subway is (make-subway boolean number). 

;; Examples

(make-bus 'xyz123 12)
(make-limo 'mrbig 10)
(make-auto 'beepbeep 2)
(make-police-car false 3)
(make-subway true 200)

;; TEMPLATE
;; pro-vehicle? : vehicle -> ???
;; consumes a vehicle V

;(define (pro-vehicle V)
;  (cond
;    ((bus? V) ... (bus-plate V) ... (bus-carries V) ...)
;    ((limo? V) ... (limo-plate V) ... (limo-carries V) ...)
;    ((car? V) ... (car-plate V) ... (car-carries V) ...)
;    ((police-car? V) ... (police-car-siren-on? V) ...
;                     ... (police-car-carries V) ...)
;    ((subway? V) ... (subway-elevated? V) 
;                 ... (subway-carries V) ...)))
