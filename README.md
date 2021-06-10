# Faustao-Language
Linguagem do Faustão criada em compiladores

Para executar
1 - flex faustao.l
2 - bison -dy faustao.y
3 - gcc lex.yy.c y.tab.c -o faustaoLanguage.exe

##Colinha para ajudar
Imprime na tela     = 	essaFera (print)
Sai                 =	olokoBixo (exit)
IF                  =	brincadeiraMeu (if)
ELSE                =	eita (else)
IF ELSE             =	taPegandoFogoBixo (if else)
WHILE               =	churrasqueiraEletrica (while)
DO                  =	fazAoVivo (do)

EXEMPLOS

1 - 
    a = 1; 
    b = 2; 
    churrasqueiraEletrica b < 20 fazAoVivo b = b + 1; 
    essaFera b;
    
2 -
    a = 1; 
    b = 3; 
    c = 5; 
    brincadeiraMeu a == c-b/2 eita a = 10; 
    essaFera a; 
    
3 -
    a = 2; 
    b = 3; 
    c = 1;
    churrasqueiraEletrica c < b*a fazAoVivo c = c * 4; 
    essaFera c; 
