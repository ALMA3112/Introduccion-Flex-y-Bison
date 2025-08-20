%{
#include "Ejercicio1.tab.h"
%}

%%
"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"|"     { return ABS; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return '\n'; }
[ \t]   { /* ignore whitespace */ }
"//".*  {return COMMENT; }
.       { return yytext[0]; }
%%