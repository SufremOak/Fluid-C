# Fluid-C++
An superset of C++, Cython, and Objective-C++

## Concept
An combination of 3 powerful programming languages into a two supersets: Fluid-C++ and Objective-F++

### The diference between ObjF++ and FluidCpp
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
    - Objective-F is not compatible with Objective-C or Objective-C++, but Fluid-C++ is compatible with C/C++.
    - in Fluid-C++ you can also use an Cython-like syntax with the `Cython.h` header:
    ```cpp
    #include <FluidC++>
    #include <Cython.h>

    #define int as Cyt.pyf

    cdef string from "string.h":
       cstr.makerStr = (name, age, stack) then
          setStr.c = ("Mateo", "26", "90s")
    ```
