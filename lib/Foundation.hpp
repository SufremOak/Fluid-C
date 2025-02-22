#ifndef FOUNDATION_HPP
#define FOUNDATION_HPP

#include "FluidC++.hpp"
#include <iostream>

// Foundation class definitions

@interface NSObject
- (void) init(self);
@end

@implementation NSObject
- (void) init(self) {
    // Initialization code
}
@endImpl

@interface NSString : public std::string
- (NSString) initWithCString(self, const char* cstr);
- (const char*) cString(self);
@end

@implementation NSString
- (NSString) initWithCString(self, const char* cstr) {
    self->assign(cstr);
    return *self;
}
- (const char*) cString(self) {
    return self->c_str();
}
@endImpl

@interface NSArray : public std::vector<NSObject*>
- (void) addObject(self, NSObject* obj);
- (NSObject*) objectAtIndex(self, size_t index);
@end

@implementation NSArray
- (void) addObject(self, NSObject* obj) {
    self->push_back(obj);
}
- (NSObject*) objectAtIndex(self, size_t index) {
    return self->at(index);
}
@endImpl

#endif // FOUNDATION_HPP