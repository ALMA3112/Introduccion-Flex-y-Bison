/* simplest version of calculator */
%{
#include <stdio.h>

int yylex(void);
void yyerror(char *s);
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token COMMENT
%token EOL
%token AND OR


%%
input:
      /* vacio */
    | input line
    ;

line:
      '\n'
    |exp '\n' { printf("\t%.d (%#lx)\n", $1, (unsigned long)$1); }
    |COMMENT '\n'  { /*Ignorar comentario*/ }
    ;

exp: factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    |exp AND factor {$$ = $1 & $3; }
    |exp OR factor {$$ =$1 | $3; }
    ;

factor: term
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { $$ = $1 / $3; }
    ;

term: NUMBER
    | ABS term { $$ = $2 >= 0 ? $2 : -$2; }
    ;
%%

int main(int argc, char **argv) {
    yyparse();
}

void yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
}