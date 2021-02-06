;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Estruturas_01) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define-struct aluno (nome curso tutor))
;; Um elemento do conjunto Aluno tem o formato
;; (make-aluno n c p)
;; onde:
;; n : String, representa o nome do aluno
;; c : String, representa o curso do aluno
;; p : String, representa o professor tutor do aluno

;; verifica-tutor : Aluno → Booleano
;; Dado um aluno, verifica se seu tutor é Mario
;; Exemplos:
;; (verifica-tutor (make-aluno “José" “BTC" “João”)) = false
;; (verifica-tutor ANA) = true
(define (verifica-tutor a)
 (cond
   ;; Se o tutor do aluno for Mario devolve true
 [(string=? (aluno-tutor a) "Mario") true]
   ;; Senão, devolve false
 [else false]
 )
 )

;; muda-tutor : Aluno → Aluno
;; Dado um aluno, modifica seu tutor para Luís caso o tutor seja Mario
;; Exemplos: ...
(define (modifica-tutor a)
  ;;Dado um aluno a
 (cond
   ;; Se o tutor do aluno a for Mario, devolve um novo registro para o aluno a
 [(string=? (aluno-tutor a) "Mario")
(make-aluno
 (aluno-nome a) ;; nome do aluno a
 (aluno-curso a) ;; curso do aluno a
 “Luis”)] ;; novo professor: Mario

   ;; Senão devolve o registro do aluno a inalterado
 [else a]) )

;; muda-tutor2: Aluno Símbolo String -> Aluno
;; Dado um aluno, o nome do professor que está se aposentando e o nome do seu
;; substituto, modifica o tutor do aluno para o substituto, caso o tutor quem
;; está se aposentando
;; Exemplos...
(define (modifica-tutor a prof-aposent prof-novo)
  ;; Dados um aluno a e dois nomes de professores prof-aposent e prof-novo
  (cond
    ;; se o tutor do aluno a for prof-aposent, devolve um novo registro para o aluno a
    [(string=? (aluno-tutor a) (prof-aposent)
               (make-aluno
                (aluno nome a) ;; nome do aluno a
                (aluno-curso a) ;; cursod do aluno a
                prof-novo)) ;;novo professor
     ;; Senão, devolve o registro do aluno a inalterado
     [else a]]))




    

