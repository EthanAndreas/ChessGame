#!/bin/bash

make clean
make

# Test 0 : Test on end of game during 2 seconds
rm -f example/output.txt
timeout 1  cat example/quit.txt | ./bin/exe >> example/output.txt
if [ `grep -c "End of game !" example/output.txt` == 1 ]
then
    printf "Test 0 (/quit):\033[92m OK\033[0m\n"
else
    printf "Test 0 (/quit):\033[91mNo ERROR\033[0m\n"
fi

# # Test 1 : Test on check situation
rm example/output.txt
timeout 1 cat example/check.txt | ./bin/exe >> example/output.txt
if [ `grep -c "Check's situation" example/output.txt` == 1 ]
then
    printf "Test 1 (check):\033[92m OK\033[0m\n"
else
    printf "Test 1 (check):\033[91mNo ERROR\033[0m\n"
fi

# # Test 2 : Test on checkmate 
rm example/output.txt
timeout 1 cat example/checkmate.txt | ./bin/exe >> example/output.txt
if [ `grep -c "Checkmate !" example/output.txt` == 1 ]
then
    printf "Test 2 (checkmate):\033[92m OK\033[0m\n"
else
    printf "Test 2 (checkmate):\033[91mNo ERROR\033[0m\n"
fi

# # Test 3 : Test on stalemate 
rm example/output.txt
timeout 1 cat example/stalemate.txt | ./bin/exe >> example/output.txt
if [ `grep -c "Stalemate !" example/output.txt` == 1 ]
then
    printf "Test 3 (stalemate):\033[92m OK\033[0m\n"
else
    printf "Test 3 (stalemate):\033[91mNo ERROR\033[0m\n"
fi

# # Test 4 : Test on kingside castling 
rm example/output.txt
timeout 1 cat example/kingside-castling.txt | ./bin/exe >> example/output.txt
if [ `grep -c "Castling done !" example/output.txt` == 2 ]
then
    printf "Test 4 (kingside castling):\033[92m OK\033[0m\n"
else
    printf "Test 4 (kingside castling):\033[91mNo ERROR\033[0m\n"
fi

# # Test 5 : Test on queeside castling 
rm example/output.txt
timeout 1 cat example/queenside-castling.txt | ./bin/exe >> example/output.txt
if [ `grep -c "Castling done !" example/output.txt` == 2 ]
then
    printf "Test 5 (queenside castling):\033[92m OK\033[0m\n"
else
    printf "Test 5 (queenside castling):\033[91mNo ERROR\033[0m\n"
fi

# # Test 6 : Test on pawn's take
rm example/output.txt
timeout 1 cat example/pawn_take.txt | ./bin/exe >> example/output.txt
if [ `grep -c "Pawn's take done !" example/output.txt` == 1 ]
then
    printf "Test 6 (pawn take):\033[92m OK\033[0m\n"
else
    printf "Test 6 (pawn take):\033[91m ERROR\033[0m\n"
fi

# # Test 7 : Test on pawn's take
rm example/output.txt
timeout 1 cat example/draw_game.txt | ./bin/exe >> example/output.txt
if [ `grep -c "The game is a draw !" example/output.txt` == 1 ]
then
    printf "Test 7 (draw game):\033[92m OK\033[0m\n"
else
    printf "Test 7 (draw game):\033[91m ERROR\033[0m\n"
fi

# # Test 8 : Test on pawn's promotion
rm example/output.txt
timeout 1 cat example/promotion.txt | ./bin/exe >> example/output.txt
if [ `grep -c "Promotion done !" example/output.txt` == 2 ]
then
    printf "Test 8 (promotion):\033[92m OK\033[0m\n"
else
    printf "Test 8 (promotion):\033[91m ERROR\033[0m\n"
fi

# # Test 9 : Test on draw game with king against king situation
rm example/output.txt
timeout 1 cat example/lack_piece_checkmate.txt | ./bin/exe >> example/output.txt
if [ `grep -c "The game is a draw !" example/output.txt` == 1 ]
then
    printf "Test 9 (king against king situation):\033[92m OK\033[0m\n"
else
    printf "Test 9 (king against king situation):\033[91m ERROR\033[0m\n"
fi

# # Test 10 : Test on draw game with king against king situation
rm example/output.txt
timeout 1 cat example/display.txt | ./bin/exe >> example/output.txt
if [ `grep -c ",wN,,wK,wQ,,,,,bP,,,,,,,,,,,,,,bP,,,bP,,bP,,,,,,wP,,wP,,wP,,bN,,,,,,,bB,,wP,,,,,,,,,,bK,bQ,,bN,," example/output.txt` == 1 ]
then
    printf "Test 10.0 (display):\033[92m OK\033[0m\n"
else
    printf "Test 10.0 (display):\033[91m ERROR\033[0m\n"
fi

if [ `grep -c "♜ 2 ♛ 0 ♟ 4 ♚ 0 ♞ 1 ♝ 2" example/output.txt` == 1 ]
then
    printf "Test 10.1 (display):\033[92m OK\033[0m\n"
else
    printf "Test 10.1 (display):\033[91m ERROR\033[0m\n"
fi

if [ `grep -c "♜ 2 ♛ 0 ♟ 4 ♚ 0 ♞ 1 ♝ 2" example/output.txt` == 1 ]
then
    printf "Test 10.2 (display):\033[92m OK\033[0m\n"
else
    printf "Test 10.2 (display):\033[91m ERROR\033[0m\n"
fi
