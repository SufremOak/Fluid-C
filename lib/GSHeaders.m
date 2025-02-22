#import <Foundation/Foundation.h>

@interface Headers: NSObject
- (NSArray*) listHeadersInDirectory:(NSString*)directory;
- (NSArray*) searchHeadersInDirectory:(NSString*)directory withKeyword:(NSString*)keyword;
@end

@implementation Headers
- (NSArray*) listHeadersInDirectory:(NSString*)directory {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *files = [fileManager contentsOfDirectoryAtPath:[directory cString] error:nil];
    NSMutableArray *headers = [NSMutableArray array];
    
    for (NSString *file in files) {
        if ([file hasSuffix:@".hpp"]) {
            [headers addObject:file];
        }
    }
    return headers;
}

- (NSArray*) searchHeadersInDirectory:(NSString*)directory withKeyword:(NSString*)keyword {
    NSArray *headers = [self listHeadersInDirectory:directory];
    NSMutableArray *results = [NSMutableArray array];
    
    for (NSString *header in headers) {
        NSString *filePath = [NSString stringWithFormat:@"%@/%@", directory, header];
        NSString *content = [NSString stringWithContentsOfFile:[filePath cString] encoding:NSUTF8StringEncoding error:nil];
        
        if ([content containsString:keyword]) {
            [results addObject:header];
        }
    }
    return results;
}
@end

int main() {
    @autoreleasepool {
        Headers *headers = [[Headers alloc] init];
        NSString *directory = @"/home/miguel/Documents/FluidCyPlusPlus/lib";
        NSString *keyword = @"#define";
        
        NSArray *allHeaders = [headers listHeadersInDirectory:directory];
        NSLog(@"All .hpp headers: %@", allHeaders);
        
        NSArray *searchedHeaders = [headers searchHeadersInDirectory:directory withKeyword:keyword];
        NSLog(@"Headers containing '%@': %@", keyword, searchedHeaders);
    }
    return 0;
}
