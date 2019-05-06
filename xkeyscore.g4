grammar xkeyscore;

/*
Parser Rules
 */

body    : expression+ EOF;

expression  : assignment
            | bool
            | functionCall
            | ATOM
            ;

bool : (LOGICAL expression)+;

assignment  : '=' expression;

functionCall    : tag LPAREN arguments RPAREN;

arguments   : expression (',' expression)*;

tag     : NAMED;

/*
Lexer Rules
 */

WS  : [ \t\u000C\r\n]+ -> skip;

ATOM : STRING | NUMBER;

LOGICAL : AND | OR;

LPAREN  : '(';
RPAREN  : ')';

NAMED   : [a-zA-Z_]+;

fragment AND : 'AND' | 'and';
fragment OR : 'OR' | 'or';

fragment STRING  : '"' ~('"')* '"';
fragment NUMBER  : [0-9](.[0-9]+)?;