;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex05operations_with_images) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define ratio-tree 50)
(define tree (overlay/xy (circle ratio-tree "solid" "green")
                         (/ ratio-tree 2) (* ratio-tree 1.5)
                      (rectangle ratio-tree (* ratio-tree 2) "solid" "brown")))
(define ratio-boat 50)
(define boat (overlay/xy (overlay/xy (rectangle (* ratio-boat 3) ratio-boat "solid" "brown")
                        (/ (* ratio-boat  3) 2) (* ratio-boat -2) 
                        (rectangle 2 (* ratio-boat 2) "solid" "black"))
    (/ ratio-boat 2)   5
  (triangle (* ratio-boat 2) "solid" "red")))

tree
boat
                        
