%{
#include <stdio.h>
#include <string>
#include "rapidjson/document.h"
#include "rapidjson/writer.h"
#include "rapidjson/stringbuffer.h"
using namespace std;
using namespace rapidjson;
extern int yylex();
extern void yyerror(char*);
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
				printf("Currency set to %s",$2);
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

int main()
{
        yyin=fopen("config.txt","r");
        yyparse();
        
        
        // 1. Parse a JSON string into DOM.
        const char* json = "{\"project\":\"rapidjson\",\"stars\":10}";
        Document d;
        d.Parse(json);
        
        // 2. Modify it by DOM.
        Value& s = d["stars"];
        s.SetInt(s.GetInt() + 1);
        
        // 3. Stringify the DOM
        StringBuffer buffer;
        Writer<StringBuffer> writer(buffer);
        d.Accept(writer);
        
        // Output {"project":"rapidjson","stars":11}
        printf("%s",buffer.GetString());
        return 1;
} 