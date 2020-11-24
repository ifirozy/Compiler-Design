%{
#include <stdio.h>
%}

%token NUMBER
%%
statement:	expression		{ printf("In yacc: = %d\n", $1); }
	;

expression:	expression '+' NUMBER	{ $$ = $1 + $3;
					printf ("In yacc: Recognized '+' expression.\n");
					}
	|	expression '-' NUMBER	{ $$ = $1 - $3; 
					printf ("In yacc: Recognized '-' expression.\n");
					}
	|	NUMBER			{ $$ = $1; 
					printf ("In yacc: Recognized a number.\n");
					}
	;

%%
int main (void) {
	return yyparse();
	}

/* Added because panther doesn't have liby.a installed. */
int yyerror (char *msg) {
	return fprintf (stderr, "YACC: %s\n", msg);
	}
