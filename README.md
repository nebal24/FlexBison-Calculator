###Flex Bison Calculator 
```
steps to compile:
(Linux / WSL)
1-bison -d calc.y
2-flex calc.l
3-gcc calc.tab.c lex.yy.c -o calc
4-./calc
(PowerShell):
1-gcc calc.tab.c lex.yy.c -o calc
2- .\calc.exe
``` 