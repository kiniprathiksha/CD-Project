%{
#include <stdio.h>
#include <stdlib.h>

int n = 10; // Define "n" with an initial value

int maxval = 0; // Initialize "maxval"

%}

%token INT NAME NUMBER MAIN FOR IF RETURN LBRACE RBRACE LPAREN RPAREN SEMICOLON EQ GT LT GEQ LEQ NEQ

%left '+' '-'
%left '*' '/'

%%

program: INT MAIN LPAREN RPAREN compound_statement
;

compound_statement: LBRACE statement_list RBRACE
;

statement_list:
    | statement_list statement
    ;

statement:
    declaration
    | assignment
    | for_loop
    | if_statement
    | return_statement
    ;

declaration: INT NAME SEMICOLON
;

assignment: NAME EQ expression SEMICOLON
;

for_loop: FOR LPAREN assignment condition SEMICOLON assignment RPAREN compound_statement
;

condition: expression GT expression
         | expression LT expression
         | expression GEQ expression
         | expression LEQ expression
         | expression EQ expression
         | expression NEQ expression
;

if_statement: IF LPAREN condition RPAREN compound_statement
;

return_statement: RETURN expression SEMICOLON
;

expression: expression '+' term
          | expression '-' term
          | term
;

term: term '*' factor
     | term '/' factor
     | factor
;

factor: NAME
      | NUMBER
;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    exit(1);
}

int main() {
    yyparse();
    printf("Parsing completed successfully.\n");
    return 0;
}
