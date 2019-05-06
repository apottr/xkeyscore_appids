grammar xkeyscore;

/*
Parser Rules
 */

body : expression+ SC EOF;

expression  : assignment
            | bool
            | functionCall
            | variable
            | ATOM
            ;

bool : (LOGICAL expression)+;

assignment  : EQ expression;

functionCall    : tag LPAREN arguments RPAREN;

arguments   : expression expression*;

tag     : NAMED;

variable : DS NAMED;

/*
Lexer Rules
 */

WS  : [ \t\u000C\r\n]+ -> skip;

ATOM : STRING | NUMBER | REGEX;

LOGICAL : AND | OR;

/*
Single character definitions
*/

LPAREN  : '(';
RPAREN  : ')';

EQ: '=';
SC: ';';
DS: '$';

NAMED   : LETTER+;

fragment AND : 'AND' | 'and';
fragment OR : 'OR' | 'or';

fragment STRING  : '"' ~('"')* '"';
fragment NUMBER  : [0-9](.[0-9]+)?;
fragment REGEX   : '/' (ESCAPESEQ | .)+? '/'; //matches \/ escape sequence or any single character w/ non-greedy wildcard
fragment ESCAPESEQ : '\/';
fragment LETTER : [a-zA-Z_];
