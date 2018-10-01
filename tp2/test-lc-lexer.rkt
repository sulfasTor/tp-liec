#lang racket/base

(require racket/port
         "lc-lexer.rkt")

(define (lex in)
  (let loop((t (tokenize in)))
    (unless (eq? t 'Eof)
      (write t)
      (loop (tokenize in))))
  (newline))

(define argv (current-command-line-arguments))
(cond
  ((= (vector-length argv) 1)
   (define content (open-input-file (vector-ref argv 0)))
   (lex content))
  (else
   (eprintf "Usage: racket lexer.rkt \"file\"\n")
   (exit 1)))
