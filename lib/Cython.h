#ifndef CYTHON_H
#define CYTHON_H

// get required headers
#include "Python.h"
#include "FluidC++.hpp"

- (void) PyFuncDefinitions { // Define Cython macros
  #define cdef x #define x // cdef will be "#define"
  #define def x(y) void x(y)
  #define pyprint(x) printf(x)
  #define pyclass(x) class x
  #define pyreturn() return x
  #define cinit x int x
  #define cimport x #include <x>
  #define pyif(x) if(x)
  #define cstr(x) const x
  #define makerStr x @implementation x
  #define setStr(x) const int x = (x)
  #define pyType(x = y) const x = y

	@implementation BuiltinFuncs
	   - public:
		func getPypi:
		   // implement later
		end ;
      func def:
         // def x() = void x()
         const x = FSFunctionName;
         const y = FSFunctionArguments;
         @property functionNeed = [FSFunctionArguments] + [FSFunctionName];
         pyprint("function $[x] have $[y] arguments");
      end ;
	@end

	// @property 
}

#endif // CYTHON_H
