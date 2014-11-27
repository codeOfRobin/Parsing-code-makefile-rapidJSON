#include <iostream>
#include "Monopoly.h"
extern int bisonParser();
extern Monopoly game;
int main(int argc, char const *argv[])
{
    std::cout<<game.locations.size()<<endl<<"somethin";
	std::cout<<bisonParser()<<"I rock";
    std::cout<<game.currency.c_str();
    std::cout<<game.taxPercent;
    return 0;
}