%{
#include "y.tab.h"
extern int yylval;
%}

%option noyywrap

%%
[0-9]+	{ yylval = atoi (yytext); 
	printf ("In lex: scanned the number %d\n", yylval);
	return NUMBER; }
[ \t]	{ printf ("In lex: skipped whitespace\n"); }
\n	{ printf ("In lex: reached end of line\n");
	return 0;
	}
.	{ printf ("In lex: found other data \"%s\"\n", yytext);
	return yytext[0];
	/* so yacc can see things like '+', '-', and '=' */
	}
%%
