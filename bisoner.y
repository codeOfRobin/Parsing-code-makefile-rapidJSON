%{
#include <stdio.h>
#include <string>
#include <map>
#include <fstream>
#include "rapidjson/document.h"
#include "rapidjson/writer.h"
#include "rapidjson/stringbuffer.h"
#include <boost/archive/text_oarchive.hpp>
#include <boost/archive/text_iarchive.hpp>
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
				
                game.currency=*($2);
			}
			
location_set:
			LOCATIONWORD LTOKEN INTEGER WORD GTOKEN INTEGER
			{
            Location newCity;
            newCity.locationNo=$3;
            newCity.name=*($4);
            newCity.group=$6;
            game.locations.push_back(newCity);
            printf("new city %d named %s in group %d\n",newCity.locationNo,newCity.name.c_str(),newCity.group );
			}
startingMoney_set:
            STARTINGMONEYTOKEN INTEGER
            {
                game.startingMoney=$2;
            
            printf("starting money set to %f \n",game.startingMoney);
            }
jailFine_set:
            JAILFINETOKEN INTEGER
            {
                game.jailFine=$2;
                printf("jailfine set to %f\n",game.jailFine);
            }

route_add:
            RTOKEN LTOKEN INTEGER LTOKEN INTEGER
            {
                game.graph[$3][$5]=true;
                printf("Route set up between location no %d \n",game.graph[$3][$5]);
            }

tax_set:
        TAXTOKEN INTEGER PERCENTSIGN INTEGER
        {
            game.taxPercent=$2;
            game.taxAmount=$4;
            printf("tax set to %f percent\n",game.taxPercent );
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
    
    std::cout<<game.currency.c_str();
    string json="{ \"hello\" : \"world\"} ";
    rapidjson::Document d;
    d.Parse<0>(json.c_str());
    
    printf("%s\n", d["hello"].GetString());
    
    ofstream ofs("filename");
    
    // save data to archive
    {
        boost::archive::text_oarchive oa(ofs);
        // write class instance to archive
        oa << game;
    	// archive and stream closed when destructors are called
    }
    return 1;
} 