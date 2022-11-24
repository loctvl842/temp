grammar BKOOL;

@lexer::header {
from lexererr import *
from BKITLexer import BKITLexer;
}

options{
	language=Python3;
}

program: miniPHP EOF; // write for program rule here using vardecl and funcdecl

miniPHP: assigns;

assigns: assigns assign | assign;
assign: VARNAME EQ expr SEMI;
VARNAME: ID;

/* operand */
INTLIT: [0-9]+;
FLOATLIT: INTLIT '.' INTLIT;
STRINGLIT: (SQUOTE CHAR+ SQUOTE) | (DQUOTE CHAR+ DQUOTE);
fragment CHAR: ~[\r\n"'];
idx_ARRAY: ARRAY LP (exprs | ) RP;
asso_ARRAY: ARRAY LP (pairs | ) RP;

pairs: pairs COMMA pair | pair;
pair: PAIRNAME ARROW expr;
PAIRNAME: ID;

exprs: exprs COMMA expr | expr;
expr: expr1 DQUES expr1 | expr1;
expr1: expr2 (ADD | SUB) expr1 | expr2;
expr2: expr2 (MUL | DIV | MOD) expr3 | expr3;
expr3: expr3 DOT expr4 | expr4;
expr4: expr5 DSTAR expr4 | expr5;
expr5: INTLIT | FLOATLIT | STRINGLIT | sub_expr;
sub_expr: LP expr RP;

EQ: '=';
SEMI: ';';
COMMA: ',';
ARROW: '=>';
LP: '(';
RP: ')';
ARRAY: 'array';

/* operator */
DSTAR: '**';
DOT: '.';
MUL: '*';
DIV: '/';
MOD: '%';
ADD: '+';
SUB: '-';
DQUES: '??';
SQUOTE: '\'';
DQUOTE: '"';
ID: [a-zA-Z]+; 



/* WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines */
WS: [ \t\r\n] -> skip;

ERROR_CHAR: . {raise ErrorToken(self.text)};
UNCLOSE_STRING: .{raise UncloseString(self.text)};
ILLEGAL_ESCAPE: .{raise IllegalEscape(self.text)};

