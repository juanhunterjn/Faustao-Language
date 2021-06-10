%{
     #include "y.tab.h"
     int yyerror(char *errormsg);
     int yyparse();
     int symbols[52];
%}
  
%%

"essaFera"                    {return ESSAFERA;}
"olokoBixo"                   {return OLOKOBIXO;}
"brincadeiraMeu"              {return BRINCADEIRAMEU;}
"eita"                        {return EITA;}
"taPegandoFogoBixo"           {return TAPEGANDOFOGOBIXO;}
"churrasqueiraEletrica"       {return CHURRASQUEIRAELETRICA;}
"fazAoVivo"                   {return FAZAOVIVO;}
">="                          {return MAIORIGUAL;}
"<="                          {return MENORIGUAL;}
">"                           {return MAIOR;}
"<"                           {return MENOR;}
"=="                          {return IGUAL;}
"!="                          {return DIFERENTE;}
"||"                          {return OU;}
"&&"                          {return E;}
[a-zA-Z]                      {yylval.id = yytext[0]; return LETRA;}
[a-zA-Z]+                     {yylval.str = yytext; return PALAVRA;}
[0-9]+                        {yylval.num = atoi(yytext); return NUMERO;}
[ \t\n]                       ;
[-+=;*/^%]                    {return yytext[0];}
[-[]+.,><]                    { return yytext[0]; }
.                             {ECHO; yyerror ("Nao to ligado nesse token");}

%%

int main(void) {
     int i;
	for(i=0; i<52; i++) {
	     symbols[i] = 0;
	}
     {printf("\n =================================== \n");}
     {printf("\n ESTA NO AR... DOMINGAO DO FAUSTAO ! \n");}
     {printf("\n =================================== \n");}
     yyparse();
     return 0;
}

int yywrap(void){
     return 0;
}

int yyerror(char *errormsg){
      fprintf(stderr, "%s\n", errormsg);
      exit(1);
}