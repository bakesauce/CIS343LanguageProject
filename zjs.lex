%{
	#include <stdio.h>
	void printLexeme();
%}

%option yylineno

%%

[0-9]+			{ printf("INT\n"); }
[0-9]*\.[0-9]+	 	{ printf("FLOAT\n"); }
end			{ printf("END\n"); }
point			{ printf("POINT\n"); }
line			{ printf("LINE\n"); }
circle			{ printf("CIRCLE\n"); }
rectangle		{ printf("RECTANGLE\n"); }
set_color		{ printf("SET_COLOR\n"); }
;			{ printf("END_STATEMENT\n"); }
\n|\t|" "		;
.			{printf("error\t"); printLexeme(); }

%%

int main (int argc, char** argv){
	yylex();
	return 0;

}

void printLexeme() {
	printf("(%s) on line (%d)\n", yytext, yylineno);
}
