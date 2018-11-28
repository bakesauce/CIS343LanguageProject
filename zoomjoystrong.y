%{
	#include <stdio.h>
	#include "zoomjoystrong.h"
	int yyerror(const char* err);
%}

%token INT
%token FLOAT
%token END
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token END_STATEMENT

%%

program:	list_of_expr
	;

list_of_expr:	expr
	|	list_of_expr expr
	;

expr:		LINE value value value value
	|	POINT value value
	|	CIRCLE value value value
	|	RECTANGLE value value value value
	|	SET_COLOR value value value
	|	END_STATEMENT
	;

value:		INT
	|	FLOAT
	;
%%

int main(int argc, char** argv){
	setup();	
	yyparse();
	finish();
}
int yyerror(const char* err){
	printf("%s\n", err);
}
