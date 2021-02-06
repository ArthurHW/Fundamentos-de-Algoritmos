;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
#|

1. empty

empty is a list of symbols, from the data definition.

2. (cons 'ball empty)

Since 'ball is a symbol and empty is a list of symbols,
(cons 'ball empty) is also a list of symbols.

3. (cons 'arrow (cons 'ball empty))
w
Since 'arrow is a symbol, and (cons 'ball empty) is a list of symbols, from 2., we know that (cons 'arrow (cons 'ball empty)) is a list of symbols.

4. (cons 'clown empty)

Since 'clown is a symbol and empty is a list of symbols, from the data definition, (cons 'clown empty) is a list of symbols.

5. (cons 'bow (cons 'arrow (cons 'ball empty)))

Since 'bow is a symbol and (cons 'arrow (cons 'ball empty)) is
a list of symbols, from 3., (cons 'bow (cons 'arrow (cons 'ball empty))) is a list of symbols.

6. (cons 'clown (cons 'bow (cons 'arrow (cons 'ball empty))))

Since 'clown is a symbol and (cons 'bow (cons 'arrow (cons 'ball empty))) is a list of symbols, from 5., (cons 'clown (cons 'bow (cons 'arrow (cons 'ball empty)))) is a list of symbols.

|#