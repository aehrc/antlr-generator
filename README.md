# antlr-generator
How to use:
1. npm install

2. npm start

How to generate parsers and lexers from ANTLR grammars:
1. Rename your parser grammar as MyGrammar and parser file name as MyGrammar.g4
2. Rename your lexer grammar as MyLexer and lexer file name as MyLexer.g4
3. At command line, run the following commands in order: 
  antlr4 -Dlanguage=JavaScript antlr-web/parser/MyLexer.g4 -o antlr-web/parser/

  antlr4 -Dlanguage=JavaScript antlr-web/parser/MyGrammar.g4 -o antlr-web/parser/
