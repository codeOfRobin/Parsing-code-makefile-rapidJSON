%{
#include <stdio.h>
#include <string>
#include <map>
#include "rapidjson/document.h"
#include "rapidjson/writer.h"
#include "rapidjson/stringbuffer.h"
#include "Monopoly.h"
using namespace std;
extern int yylex();
extern void yyerror(char*);
Monopoly game;
void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
}


%}

%token LTOKEN INTEGER LOCATIONWORD WORD GTOKEN CURRENCYTOKEN JAILFINETOKEN STARTINGMONEYTOKEN RTOKEN COSTTOKEN RENTTOKEN FILEPATHTOKEN OBJEXTENSION MODELTOKEN TAXTOKEN PERCENTSIGN

%union{
  std::string *str;
  int number;
}
%token <number> INTEGER
%token <str> WORD

%%
commands: /* empty */
        | command commands
        ;

command:
        currency_set
        |
        location_set
        |
        startingMoney_set
        |
        jailFine_set
        |
        route_add
        |
        cost_set
        |
        rent_set
        |
        filepath_found
        |
        tax_set
        ;
filepath_found:MODELTOKEN LTOKEN INTEGER FILEPATHTOKEN WORD OBJEXTENSION
        {
            printf(" File %s HAS BEEN IMPORTED for location number %d \n",$5,$3 );
        }

rent_set:RENTTOKEN LTOKEN INTEGER INTEGER INTEGER INTEGER INTEGER INTEGER INTEGER   
        {
            printf("rent for house no 4 is %d \n",$7);
        } 
cost_set:COSTTOKEN LTOKEN INTEGER INTEGER INTEGER INTEGER INTEGER INTEGER INTEGER INTEGER
        {
            printf("prices set to %d\n",$10 );
        }
currency_set:CURRENCYTOKEN WORD
			{
				
                game.currency=($2);
                printf("Currency set to %s",game.currency->c_str());
			}
			
location_set:
			LOCATIONWORD LTOKEN INTEGER WORD GTOKEN INTEGER
			{
			printf("location number %d  set to  %s in froup number %d",$3,$4,$6);
			}
startingMoney_set:
            STARTINGMONEYTOKEN INTEGER
            {
            printf("starting money set to %d \n",$2 );
            }
jailFine_set:
            JAILFINETOKEN INTEGER
            {
                printf("jailfine set to %d\n",$2);
            }

route_add:
            RTOKEN LTOKEN INTEGER LTOKEN INTEGER
            {
                printf("Route set up between location no %d and %d\n",$3,$5);
            }

tax_set:
        TAXTOKEN INTEGER PERCENTSIGN INTEGER
        {
            printf("tax set to %d percent\n",$2 );
        }


%%


int yywrap()
{
        return 1;
} 
extern FILE * yyin;

int bisonParser()
{
    yyin=fopen("config.txt","r");
    yyparse();
    
    std::cout<<game.currency->c_str();
    string json="{ \"hello\" : \"world\"} ";
    rapidjson::Document d;
    d.Parse<0>(json.c_str());
    
    printf("%s\n", d["hello"].GetString());
    return 1;
} 