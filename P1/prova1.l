%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

LETTER [a-zA-Z]
DIGIT [0-9]
ASP \"
COMMENT \/\/.*
WHITESPACE [ \n\t\r]

IDENTIFIER {LETTER}({LETTER}|{DIGIT}|_)*

%%

{COMMENT}           { }
{WHITESPACE}        { }

[0-9]+(\.[0-9]+)?   { return NUM;}
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return TIMES; }
"/"                 { return DIV; }
"("                 { return LPAREN;}
")"                 { return RPAREN;}
"="                 { return ASSIGN;}
","                 { return VIR;}
{ASP}[^\"]*{ASP}     { return STRING;}
"print"             { return PRINT;}
"concat"            { return CONCAT;}
"length"            { return LENGTH;}
{IDENTIFIER}        { return IDENT;}
.                   { return ERROR; }
%%
