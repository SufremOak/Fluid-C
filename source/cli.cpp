#include <iostream>
#include <unistd.h>

#define LINKER "../src/compiler.cpp";

using namespace std;

public:
    class Compiler() {
        //
    }

int main(int argc, char* argv[]) {
    int opt;
    while ((opt = getopt(argc, argv, "ab:c::")) != -1) {
        switch (opt) {
            case 'a':
                std::cout << "Option -a" << std::endl;
                break;
            case 'b':
                std::cout << "Option -b with value " << optarg << std::endl;
                break;
            case 'c':
                std::cout << "Option -c with optional value " << (optarg ? optarg : "none") << std::endl;
                break;
            default:
                std::cerr << "Usage: " << argv[0] << " [-a] [-b value] [-c [value]]" << std::endl;
                return 1;
        }
    }
    return 0;
}
