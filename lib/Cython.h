#ifndef CYTHON_H
#define CYTHON_H

// get required headers
#include "Python.h"
#include "FluidC++.hpp"

- (void) PyFuncDefinitions {
  #define cdef #define
  #define def(x) void(x)
  #define pyprint(x) printf(x)
  #define pyclass(x) class x
  #define pyreturn x return(x)
  #define cinit x int x
  #define cimport x #include <x>
  #define pyif(x) if(x)

	@implementation BuiltinFuncs
	   - public:
		func getPypi:
		   // implement later
		end ;
	@end

	// @property 
}

#endif // CYTHON_H
