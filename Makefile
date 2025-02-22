CC := gcc
CXX := g++
CFLAGS := -Wall -Wextra -Werror -pedantic -std=c99 -g
LDFLAGS := -lm
# TARGET := main
SRC := $(wildcard *.c)
OBJ := $(SRC:.c=.o)
OBJC_SRC := lib/GSHeaders.m
LIBS_SRC := lib/*.*

all:
	@if [ ! -d "./build" ]; then mkdir -p "./build"; fi
	$(CC) -lgnustep-base -lobjc -c $(OBJC_SRC) -o build/GSHeaders
	$(CXX) lib/*.hpp -o build/libfluid.so -shared -fPIC
	@make -f Fluid-IDE/GNUmakefile
	@exec python3 setup.py

install-libs:
	@cp libfluid.so /usr/lib
	@cp lib/*.hpp /usr/include

install:
	@cp build/$(TARGET) /usr/bin

clean:
	@rm -rf build
	@rm -f $(OBJ)
	@rm -f $(TARGET)
	@rm -f libfluid.so
	@rm -f lib/*.hpp
	@rm -f lib/*.o
	@rm -f lib/*.so
	@rm -f lib/*.so.1
	@rm -f lib/*.so.1.0.0
	@rm -f lib/*.so.
