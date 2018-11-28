%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "zoomjoystrong.tab.h"
%}

%option yylineno
%option noyywrap

%%

[0-9]+			{ yylval = atoi(yytext); return INT; }
[0-9]*\.[0-9]+	 	{ yylval = atoi(yytext); return FLOAT; }
end			{ return END; }
point			{ return POINT; }
line			{ return LINE; }
circle			{ return CIRCLE; }
rectangle		{ return RECTANGLE; }
set_color		{ return SET_COLOR; }
;			{ return END_STATEMENT; }
\n|\t|" "		;
.			{printf("error\t"); }

%%
