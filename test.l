%{

#include <stdio.h>
#include <string.h>
#include "test.tab.h"
void showError();
%}


digito         [0-9]
letra        [a-zA-Z]


%%
"+"                  { return MAS;         }
"-"                  { return MENOS;       }
"*"                  { return PRODUCTO;    }
"/"                  { return DIAGONAL;    }
"("                  { return PARENIZQ;    }
")"                  { return PARENDER;    }
";"                  { return PUNTOCOMA;   }
","                  { return COMA;        }
"."                  { return PUNTO;       }
":="                 { return BECOMES;     }
"="                  { return IGUAL;       }
"<"                  { return MENORQUE;    }
">"                  { return MAYORQUE;    }
"<="                 { return MENORIGUAL;  }
">="                 { return MAYORIGUAL;  }
"{"                  { return LLAVEIZQ;    }
"}"                  { return LLAVEDER;    }
"["                  { return CORCHETEIZQ; }
"]"                  { return CORCHETEDER; }
"||"                 { return LOGOR;       }
"&&"                 { return LOGAND;      }
"int"                { return ENTERO;      }
"float"              { return FLOTANTE;    }
"char"               { return CARACTER;    }
"void"               { return VACIO;       }
"if"                 { return CONDIF;      }
"else"               { return CONDELSE;    }
"while"              { return CICLOWHILE;  }
"return"             { return RETORNO;     }
{letra}({letra}|{digito})* {
                       yylval.id = strdup(yytext);
                       return IDENT;      }
{digito}+             { yylval.num = atoi(yytext);
                       return NUMERO;     }
[ \t\n\r]            /* skip whitespace */
.                    { printf("CARACTER DESCONOCIDO [%c]\n",yytext[0]);
                       return DESCONOCIDO;   

%%

void showError(){
    printf("Other input");
}

int yywrap(void){return 1;}

