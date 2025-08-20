%{
#include "Ejercicio3.tab.h"
#include <stdlib.h>  /*strtol*/
%}

%%
"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"|"     { return ABS; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
0[xX][0-9a-fA-F]+   { yylval = strtol(yytext, NULL, 16); return NUMBER; }
\n      { return '\n'; }
[ \t]   { /* ignore whitespace */ }
"//".*  {return COMMENT; }
.       {return yytext[0]; }
"&&"		{return AND; }
"||"	{return OR; }
%%