#lang racket

(require parser-tools/lex
         (prefix-in : parser-tools/lex-sre))

(provide first-lexer second-lexer)

(define first-lexer
  (lexer
   ((eof) 'EOF)
   (whitespace (first-lexer input-port))
   (any-char (begin
               (write input-port)
               (newline)))))

(define second-lexer
  (lexer
   ((eof) 'EOF)
   (whitespace (second-lexer input-port))
   (any-char (list 'CHAR (car (string->list lexeme))))))
