#include "game.h"
#include <iostream>
#include <stdlib.h>

int main() {

    cout << endl << GRN "Begin of the game !" NC << endl;

    Game game = Game();
    game.print();

    bool end = false;

    while (end == false)
        end = game.stroke();
}