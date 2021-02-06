;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
#|

In order for any list-of-2-symbols to belong to list-of-symbols, the
data definition for list-of-symbols tells us it must be either empty
or constructed with cons, where the first part is a symbol and the
rest part is a list of symbols. Since the first of a list-of-2-symbols
is a symbol, we only have to make sure that the rest of a
list-of-2-symbols is a list-of-symbols. Well, the rest of a
list-of-2-symbols is constructed with cons, its first part is a symbol
and its rest part is empty. Since empty is a list-of-symbols, the rest
of a list-of-2-symbols is a list-of-symbols. Since the rest of a
list-of-2-symbols is a list-of-symbols, the entire list-of-2-symbols
is a list-of-symbols.

|#