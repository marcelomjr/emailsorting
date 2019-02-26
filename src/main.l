%{

#include <stdio.h>
#include <string.h>
%}


%%

.* ;


%%

int main() {
  yylex();
  printf("Nao comecei a resolver o lab ainda!\n");
  return 0;
}
