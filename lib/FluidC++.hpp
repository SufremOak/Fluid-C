#ifndef LIBFLUIDCYPP_HPP
#define LIBFLUIDCYPP_HPP

#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cmath>
#include <algorithm>
#include <map>
#include <set>
#include <queue>
#include <stack>
#include <list>
#include <utility>
#include <functional>
#include <numeric>
#include <limits>
#include <iomanip>
#include <sstream>
#include <iterator>
#include <memory>
#include <random>
#include <chrono>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <future>
#include <atomic>
#include <type_traits>
#include <typeinfo>
#include <stdexcept>
#include <exception>
#include <initializer_list>
#include <typeinfo>
// #include "Python.h"

// Custom syntax definitions

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
#define @endclass ;
#define @method public:
#define @endmethod ;
#define @function auto
#define @endfunction ;
#define @block {
#define @endblock }
#define @return return
#define @new new
#define @delete delete
#define @namespace namespace
#define @endnamespace }
#define @using using
#define @typedef typedef
#define @const const
#define @static static
#define @virtual virtual
#define @override override
#define @final final
#define @abstract = 0
#define @extends : public
#define @implements : public
#define @enum enum class
#define @endenum ;
#define @struct struct
#define @endstruct ;
#define @union union
#define @endunion ;
#define @template template
#define @typename typename
#define @decltype decltype
#define @constexpr constexpr
#define @noexcept noexcept
#define @nullptr nullptr
#define @nullptr_t std::nullptr_t
#define @true true
#define @false false
#define @nullptr nullptr
#define @nullptr_t std::nullptr_t
#define @true true
#define @false false

// Built-in classes

@interface SysUnix
- (void) showSystemTime(self);
@end

@implementation SysUnix
- (void) showSystemTime(self) {
    std::cout << "Unix time: " << std::time(nullptr) << std::endl;
}
@endImpl

@interface MathUtils
- (double) square(self, double x);
- (double) cube(self, double x);
@end

@implementation MathUtils
- (double) square(self, double x) {
    return x * x;
}
- (double) cube(self, double x) {
    return x * x * x;
}
@endImpl

@interface StringUtils
- (std::string) toUpperCase(self, const std::string& str);
- (std::string) toLowerCase(self, const std::string& str);
@end

@implementation StringUtils
- (std::string) toUpperCase(self, const std::string& str) {
    std::string result = str;
    std::transform(result.begin(), result.end(), result.begin(), ::toupper);
    return result;
}
- (std::string) toLowerCase(self, const std::string& str) {
    std::string result = str;
    std::transform(result.begin(), result.end(), result.begin(), ::tolower);
    return result;
}
@endImpl

#endif // LIBFLUIDCYPP_HPP
