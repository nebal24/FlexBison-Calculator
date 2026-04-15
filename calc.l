%{
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror(const char *);
    #include "calc.tab.h"
%}
%%
"++"    { return INC; }
"--"    { return DEC; }
"<="    { return LE;  }
">="    { return GE;  }
"=="    { return EQ;  }
"!="    { return NE;  }
"&&"    { return AND; }
"||"    { return OR;  }


[0-9]+  { yylval.num = atoi(yytext); return NUMBER; }

[a-zA-Z]  { yylval.id = yytext[0]; return ID; }

[+\-*/%<>=*()\n]  { return *yytext; }

[ \t]   ;

.   { yyerror("invalid character"); }
%%
int yywrap(void) {
    return 1;
}
