%{

#include <stdio.h>
#include <string.h>
int feec = 0;
int unicamp = 0;
int generico = 0;

%}

VALIDO   [a-zA-Z0-9.]
INVALIDO [^a-zA-Z0-9 \n.]
FEEC fee.unicamp.br
UNICAMP unicamp.br

%%

[\n \t] {
//	printf("New line\n");
}


{VALIDO}*{INVALIDO}+{VALIDO}*[@]{VALIDO}*{INVALIDO}+{VALIDO}* 	{
//									printf("ambos [%s]\n", yytext);
}

{VALIDO}*[@]{VALIDO}*{INVALIDO}+{VALIDO}* 			{
//									printf("depois [%s]\n", yytext);
}

{VALIDO}*{INVALIDO}+{VALIDO}*[@]{VALIDO}* 			{
//									printf("antes [%s]\n", yytext);
}


{VALIDO}+[@]{VALIDO}*{FEEC}[ \n\t] { 	
				feec += 1; 
				unicamp += 1;
				generico += 1;
//			     	printf("Encontrei domínio FEEC %s\n", yytext);
} 

{VALIDO}+[@]{VALIDO}*{UNICAMP} {	
				unicamp += 1;
				generico += 1;
//				printf("Encontrei Unicamp %s\n", yytext);
}

({VALIDO}+[@]{VALIDO}+) { 
				generico += 1;
//				printf("Encontrei domínio válido [%s]\n", yytext);
}

{VALIDO}*{INVALIDO}+{VALIDO}* {
//				printf("algo errado[%s]\n", yytext);
}

{INVALIDO}*{VALIDO}+{INVALIDO}* {
//				printf("certo no lugar errado[%s]\n", yytext);
}


%%

int main() {
  yylex();
  printf("%d %d %d\n", generico, unicamp, feec);
  return 0;
}
