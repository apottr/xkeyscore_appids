grammar xkeyscore;

/*
Parser Rules
 */

body    : expression+ EOF;

expression  : functionCall
            | assignment
            | atom
            ;

assignment  : tag '=' atom;

functionCall    : tag LPAREN arguments RPAREN;

arguments   : expression (',' expression)*;

tag     : NAMED;

atom : (STRING | NUMBER);

/*
Lexer Rules
 */

LPAREN  : '(';
RPAREN  : ')';

NAMED   : [a-zA-Z]+;

STRING  : '"' ~('"')* '"';
NUMBER  : [0-9](.[0-9]+)?;

WS  : [ \t\u000C\r\n]+ -> skip;