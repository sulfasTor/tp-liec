#lang racket

(require parser-tools/lex
         (prefix-in : parser-tools/lex-sre))

(provide tokenize)

(define-empty-tokens operators
  (Eof
   Point
   Lambda
   Add Sub Mul Div Mod
   Lpar Rpar))
   
(define-tokens identifiers
  (Var))

(define-tokens numbers
  (Int))


(define tokenize
  (lexer
   ((eof) (token-Eof))
   (whitespace (tokenize input-port))
   ;   ("λ" (token-Lambda))
   ("\\" (token-Lambda))
   ("+" (token-Add))
   ("-" (token-Sub))
   ("*" (token-Mul))
   ("/" (token-Div))
   ("%" (token-Mod))
   ("(" (token-Lpar))
   (")" (token-Rpar))
   ("." (token-Point))
   ((:+ alphabetic) (token-Var lexeme))
   ((:+ numeric) (token-Int (string->number lexeme)))
   (any-char (error (format "Unrecognized char '~a' at line ~a."
                            lexeme (position-offset start-pos))))))
