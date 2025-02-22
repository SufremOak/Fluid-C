#ifndef LANGF_H
#define LANGF_H

#include <FluidC++.hpp>

@implementation LangfMacros
    - (void) macros {
        #define main int main
        #define log(x) std::cout << x << std::endl

        #define @implementation class
        #define @endImpl ;
        #define - public:
        #define (void) void
        #define self this

        #define <void> {
        #define } }

        #define func auto
        #define end ;
        #define begin {
        #define endfunc }
        #define classdef class
        #define publicdef public:
        #define privatedef private:
        #define protecteddef protected:
        #define ifdef if (
        #define endif )
        #define elsedef else
        #define fordef for (
        #define endfor )
        #define whildef while (
        #define endwhile )

        // Additional macros for more custom syntax
        #define @interface class
        #define @end ;
        #define @property public:
        #define @synthesize public:
        #define @dynamic public:
        #define @try try
        #define @catch(x) catch(x)
        #define @finally
        #define @throw throw
        #define @autoreleasepool
        #define @selector(x) &x
        #define @protocol struct
        #define @optional
        #define @required
        #define @import(x) #include <x>
        #define @include(x) #include "x"
        #define @define(x, y) #define x y
        #define @undef(x) #undef x

        #define @private private:
        #define @protected protected:
        #define @public public:
        #define @class class
    }

    + (void) SystemFunctions {
        @implementation Functions
            class FSObject {
                const Object = int x
                float DynamicObject = const int x
                struct Object {
                    const Object = arr();
                    std::const arr = z
                }
            }
        @endImpl
    }
@end

#endif // LANGF_H