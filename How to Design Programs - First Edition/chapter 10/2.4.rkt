;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; A phone-record is
;;   (make-phone-record NUM NAME)
;; where NUM is a number, and
;;       NAME is a symbol
(define-struct phone-record (num name))

;; A phone-directory is either:
;;  empty, or
;;  (cons PR PD)
;; where PR is a phone-record, and
;;       PD is a phone-directory

;; whose-number : phone-directory number -> name
;; finds the person in pd who has the number num

#|
;; Template
(define (whose-number pd num)
  (cond
    [(empty? pd) ...]
    [else (phone-record-num (first pd))
          (phone-record-name (first pd))
          (whose-number (rest pd) num)]))
|#

(define (whose-number pd num)
  (cond
    [(empty? pd) 'unknown-number]
    [else (cond
            [(= num (phone-record-num (first pd)))
             (phone-record-name (first pd))]
            [else
             (whose-number (rest pd) num)])]))

;; Examples
(whose-number empty 2029398100) "should be" 'unknown-number
(whose-number (cons (make-phone-record 2125551212 'ny-information) empty)
              2125551212)
"should be"
'ny-information
(whose-number (cons (make-phone-record 2125551212 'ny-information)
                    (cons (make-phone-record 2025551212 'dc-information)
                          empty))
              2025551212)
"should be"
'dc-information

;; phone-number : phone-directory number -> name
;; finds the number of per in pd

#|
;; Template
(define (phone-number pd per)
  (cond
    [(empty? pd) ...]
    [else (phone-record-num (first pd))
          (phone-record-name (first pd))
          (phone-number (rest pd) per)]))
|#

(define (phone-number pd per)
  (cond
    [(empty? pd) 'unlisted]
    [else (cond
            [(eq? per (phone-record-name (first pd)))
             (phone-record-num (first pd))]
            [else
             (phone-number (rest pd) per)])]))

;; Examples
(phone-number empty 'san-fransisco-info) "should be" 'unlisted
(phone-number (cons (make-phone-record 2125551212 'ny-information) empty)
              'ny-information)
"should be"
2125551212
(phone-number (cons (make-phone-record 2125551212 'ny-information)
                    (cons (make-phone-record 2025551212 'dc-information)
                          empty))
              'dc-information)
"should be"
2025551212