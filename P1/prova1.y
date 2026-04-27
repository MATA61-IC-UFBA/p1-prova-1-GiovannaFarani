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
%token LPAREN
%token RPAREN
%token ASPAS
%token CONCATENACAOF
%token PRINT
%token CONCAT
%token LENGHT
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
| PRINT LPAREN exprlist RPAREN
| expr
;

exprlist
:   IDENT
| expr

expr
: NUM
|expr PLUS expr
|expr MINUS expr
|expr TIMES expr
|expr DIV expr
|LENGHT LPAREN exprlist RPAREN
|CONCAT LPAREN CONCATENACAOF RPAREN
;

%%

