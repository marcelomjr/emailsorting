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
//	printf("New line, espaço ou tab\n");
}


{VALIDO}*{INVALIDO}+{VALIDO}*[@]{VALIDO}*{INVALIDO}+{VALIDO}* 	{
//									printf("Caractre invalido antes e depois do @ [%s]\n", yytext);
}

{VALIDO}*{INVALIDO}+{VALIDO}*[@]{VALIDO}* 			{
//									printf("Caractre invalido antes do @ [%s]\n", yytext);
}

{VALIDO}*[@]{VALIDO}*{INVALIDO}+{VALIDO}* 			{
//									printf("Caractre invalido depois do @ [%s]\n", yytext);
}


{VALIDO}+[@]{VALIDO}*{FEEC}[ \n\t] { 	
				feec += 1; 
				unicamp += 1;
				generico += 1;
//			     	printf("Encontrei domínio FEEC [%s]\n", yytext);
} 

{VALIDO}+[@]{VALIDO}*{UNICAMP} {	
				unicamp += 1;
				generico += 1;
//				printf("Encontrei dominio Unicamp [%s]\n", yytext);
}

({VALIDO}+[@]{VALIDO}+) { 
				generico += 1;
//				printf("Encontrei domínio válido [%s]\n", yytext);
}

{VALIDO}*{INVALIDO}+{VALIDO}* {
//				printf("Cadeia com caracteres invalidos[%s]\n", yytext);
}

{INVALIDO}*{VALIDO}+{INVALIDO}* {
//				printf("Cadeia com caracteres validos mas sem formar email[%s]\n", yytext);
}


%%

int main() {
  yylex();
  printf("%d %d %d\n", generico, unicamp, feec);
  return 0;
}
