%{
#include "y.tab.h"
%}

%%

int       { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z]+ { yylval = strdup(yytext); return NAME; }
"("       { return LPAREN; }
")"       { return RPAREN; }
"{"       { return LBRACE; }
"}"       { return RBRACE; }
";"       { return SEMICOLON; }
"="       { return EQ; }
">"       { return GT; }
"<"       { return LT; }
">="      { return GEQ; }
"<="      { return LEQ; }
"=="      { return EQ; }
"!="      { return NEQ; }
"+"       { return '+'; }
"-"       { return '-'; }
"*"       { return '*'; }
"/"       { return '/'; }
.         { /* Ignore anything else */ }
%%

int yywrap() {
    return 1;
}
