;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise.3.3.1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp")) #f)))
;; CONSTANTS
(define cm-per-inch 2.54)
(define inches-per-foot 12)
(define feet-per-yard 3)
(define yards-per-rod (+ 5 1/2))
(define rods-per-furlong 40)
(define furlongs-per-mile 8)
  
;; inches->cm : number -> number
;; to determine the number of cm in some number of inches
(define (inches->cm inches)
  (* inches cm-per-inch))

;; feet->inches : number -> number
;; to determine the number of inches in some number of feet
(define (feet->inches feet)
  (* feet inches-per-foot))

;; yards->feet : number -> number
;; to determine the number of feet in some number of yards
(define (yards->feet yards)
  (* yards feet-per-yard))

;; rods->yards : number -> number
;; to determine the number of yards in some number of rods
(define (rods->yards rods)
  (* rods yards-per-rod))

;; furlongs->rods : number -> number
;; to determine the number of rods in some number of furlongs
(define (furlongs->rods furlongs)
  (* furlongs rods-per-furlong))

;; miles->furlongs : number -> number
;; to determine the number of furlongs in some number of miles
(define (miles->furlongs miles)
  (* miles furlongs-per-mile))

;; feet->cm : number -> number
;; to determine the number of cm in some number of feet
(define (feet->cm feet)
  (inches->cm (feet->inches feet)))

;; yards->cm : number -> number
;; to determine the number of cm in some number of yards
(define (yards->cm yards)
  (feet->cm (yards->feet yards)))

;; rods->inches : number -> number
;; to determine the number of inches in some number of rods
(define (rods->inches rods)
  (feet->inches (yards->feet (rods->yards rods))))

;; miles->feet : number -> number
;; to determine the number of feet in some number of miles
(define (miles->feet miles)
  (yards->feet 
   (rods->yards
    (furlongs->rods
     (miles->furlongs 
      miles)))))

;; EXAMPLES AS TESTS

(check-expect (inches->cm 1) 2.54)
(check-expect (inches->cm 3) 7.62)

(check-expect (feet->inches 1) 12)
(check-expect (feet->inches 3/2) 18)

(check-expect (yards->feet 1) 3)
(check-expect (yards->feet 12) 36)

(check-expect (rods->inches 1) 198)
(check-expect (rods->inches 3/2) 297)

(check-expect (furlongs->rods 1) 40)
(check-expect (furlongs->rods 7) 280)

(check-expect (miles->furlongs 1) 8)
(check-expect (miles->furlongs 10) 80)

(check-expect (feet->cm 1) 30.48)
(check-expect (feet->cm 4) 121.92)

(check-expect (yards->cm 1) 91.44)
(check-expect (yards->cm 2) 182.88)

(check-expect (rods->inches 1) 198)
(check-expect (rods->inches 3.5) 693)

(check-expect (miles->feet 1) 5280)
(check-expect (miles->feet 4) 21120)

