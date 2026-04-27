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

IDENTIFIER {LETTER}({LETTER}|{DIGIT}|_)*
CONCATENACAO {IDENTIFIER}+(\,{IDENTIFIER})+
%%

[0-9]+(\.[0-9]+)?   { return NUM;}
(\/\/.)*            { }
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"*"                 { return TIMES; }
"/"                 { return DIV; }
"("                 { return LPAREN;}
")"                 { return RPAREN;}
"""                 { return ASPAS;}
CONCATENACAO        { return CONCATENACAOF;}
"print"             { return PRINT;}
"concat"            { return CONCAT;}
"lenght"            { return LENGHT;}
{IDENTIFIER}        { return IDENT;}
"="                 { return ASSIGN;}
[ \t]+              { }
\n                  { return EOL; }
.                   { return ERROR; }
%%
