/*
 * Student's name: Le Tran Phuc Loc
 * Student ID: 2013684
 */
grammar BKOOL;

@lexer::header {
from lexererr import *
}

options{
	language=Python3;
}

program: class_decls EOF ;

/* --- 2.1 --- */
/* class declaration */
class_decls
    : class_decl class_decls 
    | class_decl
    ;

class_decl
    : CLASS ID extend_class? LP members RP
    ;

extend_class
    : EXTENDS ID
    ;

/* class members */
members
    : (member members | )
    ;

member
    : attribute_keyword attribute_decl
    | method_keyword method_decl
    ;

attribute_keyword
    : (STATIC | FINAL | (STATIC FINAL) | (FINAL STATIC) | )
    ;

method_keyword
    : (STATIC | )
    ;

/* --- 2.2 --- */
/* attribute declaration */
attribute_decl
    : attribute_type attribute_names SEMI
    ;

attribute_type
    : INT | FLOAT | BOOLEAN | STRING
    ;

attribute_names
    : attribute_name COMMA attribute_names
    | attribute_name
    ;

attribute_name
    : ID
    | ID EQUAL_SIGN expr
    ;

/* --- 2.3 --- */
/* method declaration */
method_decl
    : normal_method
    | constructor
    ;

normal_method
    : return_type ID LB params RB block_stmt
    ;

constructor
    : ID LB params RB block_stmt
    ;

return_type
    : INT | FLOAT | BOOLEAN | STRING | VOID
    ;

params
    : (param params | )
    ;

param
    : param_type comma_sep_ids SEMI
    ;

param_type
    : INT | FLOAT | BOOLEAN | STRING
    ;

comma_sep_ids
    : ID COMMA comma_sep_ids
    | ID
    ;

/* --- 3.2 --- */
/* Comment */
COMMENT_LINE
    : '#' ~[\r\n]* '\r'? '\n'
    -> skip 
    ;

COMMENT_BLOCK
    : '/*' .*? '*/' 
    -> skip
    ;

/* --- 3.3 --- */
/* Identifier */
ID
    : [a-zA-Z_] [a-zA-Z0-9_]*
    ;

/* --- 3.4 --- */
/* Keyword */
BOOLEAN
    : 'boolean'
    ;

BREAK
    : 'break'
    ;

CLASS
    : 'class'
    ;

CONTINUE
    : 'continue'
    ;

DO
    : 'do'
    ;

ELSE
    : 'else'
    ;

EXTENDS
    : 'extends'
    ;

FLOAT
    : 'float'
    ;

IF
    : 'if'
    ;

INT
    : 'int'
    ;

NEW
    : 'new'
    ;

STRING
    : 'string'
    ;

THEN
    : 'then'
    ;

FOR
    : 'for'
    ;

RETURN
    : 'return'
    ;

TRUE
    : 'true'
    ;

FALSE
    : 'false'
    ;

VOID
    : 'void'
    ;

NIL
    : 'nil'
    ;

THIS
    : 'this'
    ;

FINAL
    : 'final'
    ;

STATIC
    : 'static'
    ;

TO
    : 'to'
    ;

DOWNTO
    : 'downto'
    ;

/* --- 3.5 --- */
/* Operator */
ADDOP
    : '+'
    ;

SUBOP
    : '-'
    ;

MULOP
    : '*'
    ;

I_DIV
    : '/'
    ;

F_DIV
    : '\\'
    ;

MOD
    : '%'
    ;

NOT_EQUAL
    : '!='
    ;

EQUAL
    : '=='
    ;

LESS
    : '<'
    ;

GREATER
    : '>'
    ;

LESS_OR_EQUAL
    : '<='
    ;

GREATER_OR_EQUAL
    : '>='
    ;

OR
    : '||'
    ;

AND
    : '&&'
    ;

NOT
    : '!'
    ;

CONCATENATION
    : '^'
    ;

ASSIGN
    : ':='
    ;

EQUAL_SIGN
    : '='
    ;

/* --- 3.6 --- */
/* Separator */
LSB
    : '['
    ;
RSB
    : ']'
    ;

LP
    : '{'
    ;
RP
    : '}'
    ;

LB
    : '('
    ;
RB
    : ')'
    ;

SEMI
    : ';'
    ;

COLON
    : ':'
    ;

DOT
    : '.'
    ;

COMMA
    : ','
    ;

/* --- 3.7 --- */
/* Literal */
INT_LIT
    : [0-9]+
    ;

FLOAT_LIT
    : [0-9]+ ('.' [0-9]* (EXPONENT)? | EXPONENT)
    ;

fragment EXPONENT
    : [Ee] ([+-])? [0-9]+
    ;

bool_lit
    : TRUE
    | FALSE
    ;

STRING_LIT
    : '"' CHAR* '"'
    ;

fragment CHAR
    : '\\' [bfrnt"\\]
    | ~[\r\n\\"]
    ;

array_lit
    : LP comma_sep_array_elmts RP
    ;

comma_sep_array_elmts
    : (elmt COMMA comma_sep_array_elmts | )
    ;

elmt
    : INT_LIT
    | FLOAT_LIT
    | bool_lit
    | STRING_LIT
    ;

/* --- 4.1 --- */
/* Primitive Type */
int_type
    : INT
    ;

float_type
    : FLOAT
    ;

bool_type
    : BOOLEAN
    ;

string_type
    : STRING
    ;

void_type
    : VOID
    ;

/* --- 4.2 --- */
/* Array Type */
array_type
    : (INT | FLOAT | BOOLEAN | STRING) LSB INT_LIT RSB
    ;

/* --- 4.3 --- */
/* Class Type */

/* -- 5 -- */
/* Expression */
expr
    : equality_expr (LESS | GREATER | LESS_OR_EQUAL | GREATER_OR_EQUAL) equality_expr
    | equality_expr
    ;

equality_expr
    : boolean_expr (EQUAL | NOT_EQUAL) boolean_expr
    | boolean_expr
    ;

boolean_expr
    : boolean_expr (AND | OR) bin_additive_expr
    | bin_additive_expr
    ;

bin_additive_expr
    : bin_additive_expr (ADDOP | SUBOP) multiplicative_expr
    | multiplicative_expr
    ;

multiplicative_expr
    : multiplicative_expr (MULOP | I_DIV | F_DIV | MOD)  concatenation_expr
    | concatenation_expr
    ;

concatenation_expr
    : concatenation_expr CONCATENATION not_expr
    | not_expr
    ;

not_expr
    : NOT not_expr
    | u_additive_expr
    ;

u_additive_expr
    : (ADDOP | SUBOP) u_additive_expr
    | idx_expr
    ;

idx_expr
    : access_expr LSB expr RSB
    | access_expr
    ;

access_expr
    : access_expr DOT ID (LB comma_sep_exprs? RB)?
    | new_expr
    ;

new_expr
    : NEW new_expr LB comma_sep_exprs? RB
    | simple_expr
    ;

simple_expr
    : atom
    ;

atom
    : literal
    | THIS
    | ID
    | LB expr RB
    ;

literal
    : INT_LIT
    | FLOAT_LIT
    | bool_lit
    | STRING_LIT
    | array_lit
    ;

comma_sep_exprs
    : (expr COMMA comma_sep_exprs | expr)
    ;

/* -- 6 -- */
/* Statement */
stmt
    : assign_stmt
    | if_stmt
    | for_stmt
    | break_stmt
    | continue_stmt
    | return_stmt
    | method_invoc_stmt
    | block_stmt
    ;

/* --- 6.1 --- */
/* Block statement */
block_stmt
    : LP var_decls stmts RP
    ;

var_decls
    : (var_decl var_decls | )
    ;

var_decl
    : FINAL? attribute_decl
    ;

stmts
    : (stmt stmts | )
    ;

/* --- 6.2 --- */
/* Assignment statement */
assign_stmt
    : lhs ASSIGN expr SEMI
    ;

lhs
    : ID
    | mutable_expr
    | array_ele
    ;

mutable_expr
    : (ID | THIS) DOT ID (LSB expr RSB)?
    ;

array_ele
    : ID LSB expr RSB
    ;

/* --- 6.3 --- */
/* If statement */
if_stmt
    : IF expr THEN stmt (ELSE stmt)?
    ;

/* --- 6.4 --- */
/* For statement */
for_stmt
    : FOR ID ASSIGN for_range DO stmt
    ;

for_range
    : init_val (TO | DOWNTO) final_val
    ;

init_val
    : expr
    ;

final_val
    : expr
    ;

/* --- 6.5 --- */
/* Break statement */
break_stmt
    : BREAK SEMI
    ;

/* --- 6.6 --- */
/* Continue statement */
continue_stmt
    : CONTINUE SEMI
    ;

/* --- 6.7 --- */
/* Return statement */
return_stmt
    : RETURN SEMI
    ;

/* --- 6.8 --- */
/* Method Invocation statement */
method_invoc_stmt
    : expr DOT ID (LB comma_sep_exprs? RB)? SEMI
    ;

WS: [ \t\n\f\r] -> skip;

UNCLOSE_STRING: '"' CHAR* ([\r\nEOF] | ~'"')
{
	err_char = ['\r','\n',EOFError]
	if self.text[-1] in err_char:
		raise UncloseString(self.text[1:-1])
	else:
		raise UncloseString(self.text[1:])
};
ILLEGAL_ESCAPE: '"' CHAR* ('\\' ~[btnfr"\\] | ~'\\')
{
	raise IllegalEscape(self.text[1:])
};

ERROR_CHAR: . 
{
	raise ErrorToken(self.text)
};

