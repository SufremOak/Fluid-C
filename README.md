# Fluid-C (Classic)
An superset of C++, Cython, and Objective-C++

## Concept
An combination of 3 powerful programming languages into a two supersets: Fluid-C++ and Objective-F++

### The diference between ObjF++ and FluidC++
- FluidC++ is not fully Object oriented, its Fluid organization oriented, that makes the code easier to read and debug, making an begginer friendly and professional language. example:
  ```cpp
  #include <FluidC++.hpp>
  #include <FluidObj>

  - (void) strMaker(canInvoque?: @true) {
    strMaker = ObjStr
    strMaker.createLine([
      name,
      age,
      stack
    ])

    @implementation ObjStr: setVars(UpValues): // <-- fluid organization can use positional string as upValue(s), upFunc, upString, UpClass, DownValue(s), DownFunc, DownString
      ObjStr = set string(name, age, stack) to string("John", "18", "Rust");
      Str = reset: @false;
      #objects organize: fluid
    @endImpl
  }
  
  main <void> {
    #invoque strMaker: strMain(upFunc);
    exit 0;
  }
  ```

- Objective-F++ is an fully object oriented language, but it doesn't have the fluid organization modules, which looks-like Objective-J, example:
    ```objective-c
    @import <langf.h>

    #implement PubObject: str {
       const str* char = () = {
         string(
            name,
            age,
            stack
        );
      };
    } EndImpl;

    - (void)sayHello:IO {
      const strings = getStr <STRING:GS>(name, age, stack) changeVar =(*"Miguel", "13", "Web");
      externFunc(strings.func);
    }
  
    int <main>(getStrs = from PubObj(str: all)) {
       GSLog(strings.func);
      return(-0);
    }
    ```
- Objective-F++ is not compatible with Objective-C or Objective-C++, but Fluid-C++ is compatible with C/C++.
- in Fluid-C++ you can also use an Cython-like syntax with the `Cython.h` header:
    ```cpp
    #include <FluidC++>
    #include <Cython.h>

    #define int as Cyt.py

    cdef string from "string.h":
       cstr.makerStr = (name, age, stack) then
          setStr.c = ("Mateo", "26", "lowasm")

    main <def> {
        pyprint(string.mod)
        exit 0;
    }
    ```

## Getting started

### 1. Building the compiler headers, and the libs
1. get the source code
   ```bash
    $ git clone https://github.com/SufremOak/Fluid-C.git
    $ cd Fluid-C
   ```
2. install the dependencies
   ```bash
   # on debian-based systems
   sudo apt install gcc g++ libobjc-dev libncurses-dev automake autoconf python3 make cmake
   # on Fedora/RHEL systems
   sudo dnf install gcc gobjc automake autoconf python3 make cmake
   # on Arch Linux based systems
   sudo pacman -S gcc g++ gobjc automake autoconf python3 make cmake
   # on macOS systems
   brew install gcc automake autoconf python3 make cmake
   # on MSYS2, install python via the python msi <https://python.org>
   pacman -S automake ncurses autoconf gobjc make cmake
   ```

   if you're in any other plataform there is the dependencies list:
   - gcc
   - g++
   - automake
   - autoconf
   - make
   - libobjc/libobjc++
   - python3.13
   - cmake
  3. install the python dependencies
     ```bash
     $ python -m venv env
     $ pip install -r requirements.txt
     ```
  4. compile
     ```bash
      $ mkdir build
      $ cd build
      $ cmake ..
      # its recommended to install it as root
      su
      root> make
      # compile only the Fluid-C++ libs
      root> make fluidcpp
      # compile only the Objective-F++ libs
      root> make objf++
      # install the compiled libs
      root> make install-libs
     ```
  ## License
  This project lays on the LGPL license


