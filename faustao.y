%{
    #include <stdio.h>
    #include <stdlib.h>

    int yylex(void);
    int yyerror(const char *s);
    int caracterTk(char CARACTER);
    int TROCAOPERACAO(char a, int OPERADOR, int b);
    int statementIGUAL(char CARACTER, int VALOR);
    int statementMAIORIGUAL(char CARACTER, int VALOR);
    int statementMENORIGUAL(char CARACTER, int VALOR);
    int statementDIFERENTE(char CARACTER, int VALOR);
    int statementMAIOR(char CARACTER, int VALOR);
    int statementMENOR(char CARACTER, int VALOR);
    int CARACTERES[52];

    void updateCaracterValor(char CARACTER, int VALOR);
    void updateCondicionalCaracterValor(int CONDICAO, char CARACTER, int VALOR);
    void LACOWHILE(char id, int TOKEN, int CONDICAO, int OPERADOR, int EXPRESSAO);
%}

%union {int num; char id; char* str;}     

%start LINE

%token ESSAFERA
%token OLOKOBIXO
%token <num> NUMERO
%token <id> LETRA
%token <str> PALAVRA 
%token BRINCADEIRAMEU EITA MENORIGUAL MAIORIGUAL IGUAL DIFERENTE OU E TAPEGANDOFOGOBIXO MAIOR MENOR CHURRASQUEIRAELETRICA FAZAOVIVO

%right '=' MENOSU

%left MAIOR MENOR MENORIGUAL MAIORIGUAL IGUAL DIFERENTE E OU '+''-' '*''/' '!' '<' '>' '%'

%type <num> LINE EXPRESSAO TERMO
%type <id> ATRIBUICAO
%type <num> CONDICIONAL
%type <num> OPERADOR
%type <num> OPERADORRELACIONAL

%%

LINE    : ATRIBUICAO ';'		        {printf("\n 8 e 7 galera! - Atribuido bixo  \n");}
        | CONDICIONALINTERNA ';'        {printf("\n 8 e 7 galera! - Brincadeira esse laco ai  \n");}
        | LACOWHILE ';'                 {printf("\n 8 e 7 galera! - Brincadeira esse laco ai  \n");}
		| OLOKOBIXO ';'		            {exit(EXIT_SUCCESS);}
		| ESSAFERA EXPRESSAO ';'		{printf("Deu : %d\n", $2);}
		| ESSAFERA PALAVRA ';'          {printf("> : %s\n", $2);}
		| LINE ATRIBUICAO ';'	        {printf("\n 8 e 7 galera! - Atribuido bixo  \n");}
		| LINE LACOWHILE ';'            {printf("\n 8 e 7 galera! - Brincadeira esse laco ai  \n");}
		| LINE CONDICIONALINTERNA ';'	{printf("\n 8 e 7 galera! - Brincadeira esse laco ai  \n");}
		| LINE ESSAFERA EXPRESSAO ';'	{printf(" Deu : %d\n", $3);}
		| LINE ESSAFERA PALAVRA ';'     {printf("> : %s\n", $3);}
		| LINE OLOKOBIXO ';'	        {exit(EXIT_SUCCESS);}
        ;

ATRIBUICAO : LETRA '=' EXPRESSAO  { updateCaracterValor($1,$3);}
           ;
            
EXPRESSAO    	: TERMO                                 {$$ = $1;}
       	        | EXPRESSAO '+' TERMO                   {$$ = $1 + $3;}
       	        | EXPRESSAO '-' TERMO                   {$$ = $1 - $3;}
                | EXPRESSAO '*' TERMO                   {$$ = $1 * $3;}
                | EXPRESSAO '/' TERMO                   {$$ = $1 / $3;}
       	        | EXPRESSAO '^' TERMO                   {$$ = $1 ^ $3;}
       	        | EXPRESSAO '%' TERMO                   {$$ = $1 % $3;}
                ;
       	
TERMO   	: NUMERO                {$$ = $1;}
		    | LETRA			{$$ = caracterTk($1);} 
            ;

CONDICIONALINTERNA : BRINCADEIRAMEU CONDICIONAL EITA LETRA '=' EXPRESSAO     { updateCondicionalCaracterValor($2,$4,$6); } 
            ;

LACOWHILE   : CHURRASQUEIRAELETRICA LETRA OPERADORRELACIONAL EXPRESSAO FAZAOVIVO LETRA '=' LETRA OPERADOR TERMO    { LACOWHILE($2,$3,$4,$9,$10); }
            ;

OPERADORRELACIONAL : IGUAL          {$$ = 1;} 
                   | MENORIGUAL     {$$ = 2;}
                   | MAIORIGUAL     {$$ = 3;}
                   | DIFERENTE      {$$ = 4;}
                   | MAIOR          {$$ = 5;}
                   | MENOR          {$$ = 6;}
                   ;          

OPERADOR : '+'  {$$ = 1;} 
         | '-'  {$$ = 2;} 
         | '*'  {$$ = 3;}
         | '/'  {$$ = 4;}
        ;

CONDICIONAL : LETRA IGUAL EXPRESSAO         {$$ = statementIGUAL($1,$3);}  
       	    | LETRA MENORIGUAL EXPRESSAO    {$$ = statementMENORIGUAL($1,$3);}
       	    | LETRA MAIORIGUAL EXPRESSAO    {$$ = statementMAIORIGUAL($1,$3);}
       	    | LETRA DIFERENTE EXPRESSAO     {$$ = statementDIFERENTE($1,$3);}
            | LETRA MAIOR EXPRESSAO         {$$ = statementDIFERENTE($1,$3);}
            | LETRA MENOR EXPRESSAO         {$$ = statementDIFERENTE($1,$3);}
            ;

%%

void LACOWHILE(char id, int TOKEN, int CONDICAO, int OPERADOR, int EXPRESSAO) {
    int identificadorRecebido = caracterTk(id);
    int tempVar;
    switch(TOKEN) {
        
        case 1 :
            while(identificadorRecebido == CONDICAO) {   
                tempVar = TROCAOPERACAO(id, OPERADOR, EXPRESSAO);
                updateCaracterValor(id, tempVar);
                identificadorRecebido = caracterTk(id);
            }
        
        case 2 :
            while(identificadorRecebido <= CONDICAO) {   
                tempVar = TROCAOPERACAO(id, OPERADOR, EXPRESSAO);
                updateCaracterValor(id, tempVar);
                identificadorRecebido = caracterTk(id);                
            }            
       
        case 3 :
            while(identificadorRecebido >= CONDICAO) {   
                tempVar = TROCAOPERACAO(id, OPERADOR, EXPRESSAO);
                updateCaracterValor(id, tempVar);
                identificadorRecebido = caracterTk(id);
            }     
        
        case 4 :
            while(identificadorRecebido != CONDICAO) {   
                tempVar = TROCAOPERACAO(id, OPERADOR, EXPRESSAO);
                updateCaracterValor(id, tempVar);
                identificadorRecebido = caracterTk(id);
            } 
      
        case 5 :
            while(identificadorRecebido > CONDICAO) {   
                tempVar = TROCAOPERACAO(id, OPERADOR, EXPRESSAO);
                updateCaracterValor(id, tempVar);
                identificadorRecebido = caracterTk(id);
            } 

        case 6 :
            while(identificadorRecebido < CONDICAO) {   
                tempVar = TROCAOPERACAO(id, OPERADOR, EXPRESSAO);
                updateCaracterValor(id, tempVar);
                identificadorRecebido = caracterTk(id);
            }            
    }
}

int TROCAOPERACAO(char a, int OPERADOR, int b) {
    int identificadorRecebido = caracterTk(a);
    switch(OPERADOR){
        case 1 :  return identificadorRecebido + b;

        case 2 :  return identificadorRecebido - b;

        case 3 :  return identificadorRecebido * b;

        case 4 :  return identificadorRecebido / b;
    }
}

int statementIGUAL(char CARACTER, int VALOR) {
    int data = caracterTk(CARACTER);
    if(data==VALOR){
        return 1;
    }
    else
    {
        return 0;
    }    
}

int statementMENORIGUAL(char CARACTER, int VALOR) {
    int data = caracterTk(CARACTER);
    if(data<=VALOR){
        return 1;
    }
    else {
        return 0;
    }    
}

int statementMAIORIGUAL(char CARACTER, int VALOR) {
    int data = caracterTk(CARACTER);
    if(data>=VALOR) {
        return 1;
    }
    else {
        return 0;
    }    
}

int statementDIFERENTE(char CARACTER, int VALOR) {
    int data = caracterTk(CARACTER);
    if(data!=VALOR) {
        return 1;
    }
    else {
        return 0;
    }    
}

int statementMAIOR(char CARACTER, int VALOR) {
    int data = caracterTk(CARACTER);
    if(data>VALOR) {
        return 1;
    }
    else {
        return 0;
    }
}

int statementMENOR(char CARACTER, int VALOR) {
    int data = caracterTk(CARACTER);
    if(data<VALOR){
        return 1;
    }
    else {
        return 0;
    }
}

int indexCaracter(char TOKEN) {
	int indexInternal = -1;
	if(islower(TOKEN)) {
		indexInternal = TOKEN - 'a' + 26;
	} else if(isupper(TOKEN)) {
		indexInternal = TOKEN - 'A';
	}
	return indexInternal;
} 

int caracterTk(char CARACTER) {
	int data = indexCaracter(CARACTER);
	return CARACTERES[data];
}

void updateCaracterValor(char CARACTER, int VALOR) {
	int data = indexCaracter(CARACTER);
	CARACTERES[data] = VALOR;
}

void updateCondicionalCaracterValor(int CONDICAO, char CARACTER, int VALOR) {
    if(CONDICAO==1) {
        int data = indexCaracter(CARACTER);
        CARACTERES[data] = VALOR;
    }
    else {
        printf("NOPS");
    }
}