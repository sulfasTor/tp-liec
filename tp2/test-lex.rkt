;; (define author "Moises TORRES AGUILAR")

#lang racket/base

(require racket/port
         "lexers.rkt")

(define (lex in)
  (let loop((t (second-lexer in)))
    (unless (eq? t 'EOF)
      (write t)
      (loop (second-lexer in))))
  (write "fini")
  (newline))

(define (second-lex in)
  (let loop((t (second-lexer in)))
    (unless (eq? t 'EOF)
      (write t)
      (newline)
      (loop (second-lexer in))))
  (write "fini")
  (newline))


;;(call-with-input-string "Ceci est un test" lex)

(define argv (current-command-line-arguments))
(cond
  ((= (vector-length argv) 1)
   (define content (open-input-file (vector-ref argv 0)))
   (second-lex content))
  (else
   (eprintf "Usage: racket lexer.rkt \"file\"\n")
   (exit 1)))

;; (define argv (current-command-line-arguments))
;; (cond
;;   ((= (vector-length argv) 1)
;;    (call-with-input-string (vector-ref argv 0) second-lex))
;;   (else
;;    (eprintf "Usage: racket lexer.rkt \"string\"\n")
;;    (exit 1)))
