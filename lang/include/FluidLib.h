#ifndef FLUIDLIB_H_
#define FLUIDLIB_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TOKENS 2000;

typedef struct FLUIDLIB_H {
    int bool;
    int token(token *context) {
        // token creation
        void createType(int argc, int argv, buffer);
        void tokenRule(int argc, index, buffer);
        void newToken(int argc, buffer);
    }
    int char = **char;
    int token_input(token *context);
    int tokenType(int argv, int argc, index);
} Scripten;


void printToken();
void defineToken();
void ifToken();
void elseToken();

class Tokenize(Scripten *context) {
    // ?
}

#endif // FLUIDLIB_H_