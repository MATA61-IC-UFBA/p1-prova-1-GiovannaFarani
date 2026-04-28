%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token EOL 0
%token ERROR
%token NUM
%token PLUS
%token MINUS
%token TIMES
%token DIV
%token VIR
%token LPAREN
%token RPAREN
%token STRING
%token PRINT
%token CONCAT
%token LENGTH
%token IDENT
%token ASSIGN

%left MINUS PLUS
%left DIV TIMES

%start program

%%

/* programa */
program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr
| PRINT LPAREN expr1 RPAREN
| expr
;


expr1
: expr
|expr1 VIR expr
;

expr
: NUM
|IDENT
|STRING
|expr PLUS expr
|expr MINUS expr
|expr TIMES expr
|expr DIV expr
|LENGTH LPAREN expr RPAREN
|CONCAT LPAREN expr1 RPAREN
|LPAREN expr RPAREN
;

%%