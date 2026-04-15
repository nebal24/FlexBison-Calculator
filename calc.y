%{
#include <stdio.h>
#include <stdlib.h>

int vars[52] = {0};

int getIndex(char c) {
    if (c >= 'a' && c <= 'z')
        return c - 'a';

    if (c >= 'A' && c <= 'Z')
        return c - 'A' + 26;

    return -1;
}

int yylex(void);
int yyerror(const char *s);
%}

%union {
    int num;
    char id;
}
/* Tokens */
%token <num> NUMBER
%token <id> ID
%token INC DEC
%token LE GE EQ NE
%token AND OR
%type <num> E L A R C D T F P


%%   

input:
      input line
    |
    ;

line:
      '\n'
    | E '\n' {printf("%d\n",$1);}
    ;

E:
      ID '=' E   {
                    vars[getIndex($1)] = $3;
                    $$ = $3;
                 }
    | L          {
                    $$ = $1;
                 }
    ;

L:
      L OR A     {
                    $$ = ($1 || $3);
                 }
    | A          {
                    $$ = $1;
                 }
    ;

A:
      A AND R    {
                    $$ = ($1 && $3);
                 }
    | R          {
                    $$ = $1;
                 }
    ;

R:
      R EQ C     {
                    $$ = ($1 == $3);
                 }
    | R NE C     {
                    $$ = ($1 != $3);
                 }
    | C          {
                    $$ = $1;
                 }
    ;

C:
      C '<' D    {
                    $$ = ($1 < $3);
                 }
    | C '>' D    {
                    $$ = ($1 > $3);
                 }
    | C LE D     {
                    $$ = ($1 <= $3);
                 }
    | C GE D     {
                    $$ = ($1 >= $3);
                 }
    | D          {
                    $$ = $1;
                 }
    ;

D:
      D '+' T    {
                    $$ = $1 + $3;
                 }
    | D '-' T    {
                    $$ = $1 - $3;
                 }
    | T          {
                    $$ = $1;
                 }
    ;

T:
      T '*' F    {
                    $$ = $1 * $3;
                 }
    | T '/' F    {
                    $$ = $1 / $3;
                 }
    | T '%' F    {
                    $$ = $1 % $3;
                 }
    | F          {
                    $$ = $1;
                 }
    ;

F:
      INC ID {vars[getIndex($2)]++; $$=vars[getIndex($2)];}
    | DEC ID {vars[getIndex($2)]--; $$=vars[getIndex($2)];}
    | ID INC { $$ = vars[getIndex($1)]; vars[getIndex($1)]++; }
    | ID DEC { $$ = vars[getIndex($1)]; vars[getIndex($1)]--; }
    | '-' F    { $$ = -$2; } 
    | P          { $$ = $1; }
    ;

P:
      ID         {
                    $$ = vars[getIndex($1)];
                 }
    | NUMBER     {
                    $$ = $1;
                 }
    | '(' E ')'  {
                    $$ = $2;
                 }
    ;

%%


int main() {
    return yyparse();
}


//To print parser errors
int yyerror(const char *s) {
    printf("Error: %s\n", s);
    return 0;
}