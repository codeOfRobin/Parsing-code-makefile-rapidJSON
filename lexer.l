%{
#include <stdio.h>
#include <string>
#include "bisoner.tab.h"
using namespace std;
%}

%%
"Tax"						return TAXTOKEN;
"rent"						return RENTTOKEN;
"cost"						return COSTTOKEN;
"route"						return RTOKEN;
"Currency"					return CURRENCYTOKEN;
"StartingMoney"				return STARTINGMONEYTOKEN;
"JailFine"					return JAILFINETOKEN;
"location"					return LOCATIONWORD;
"@l"						return LTOKEN;
"@g" 						return GTOKEN;
"model"						return MODELTOKEN;
"#"[a-zA-Z0-9.-_= ]+			printf("comment ignored\n");
[0-9]+						yylval.number=atoi(yytext);return INTEGER;
[a-zA-Z]+					yylval.str=new string(yytext);return WORD;
"./"([[a-zA-Z0-9]+"/"]*)?				return FILEPATHTOKEN;
".obj"						return OBJEXTENSION;
"%"							return PERCENTSIGN;

%%

