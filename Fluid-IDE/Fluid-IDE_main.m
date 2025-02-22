/* 
   Project: Fluid-IDE

   Author: miguel,,,

   Created: 2025-02-22 14:07:21 -0300 by miguel
*/

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface TextEditor : NSObject <NSApplicationDelegate>
@property (strong, nonatomic) NSWindow *window;
@property (strong, nonatomic) NSTextView *textView;
@end

@implementation TextEditor

- (void)applicarionDidFinishLaunching:(NSNotification *)notification {
  NSRect frame = NSMakeRect(100, 100, 600, 400);
  
  // create window
  self.window = [[NSWindow alloc] initWithContentRect:frame
    styleMask:(NSTitledWindowMask | NSClosableWindowMask | NSResizableWindowMask)
    backing:NSBackgroundStoreBuffered
    defer:NO];
}

int 
main(int argc, const char *argv[])
{
// Uncomment if your application is Renaissance application
/*  CREATE_AUTORELEASE_POOL (pool);
  [NSApplication sharedApplication];
  [NSApp setDelegate: [AppController new]];

  #ifdef GNUSTEP
    [NSBundle loadGSMarkupNamed: @"MainMenu-GNUstep"  owner: [NSApp delegate]];
  #else
    [NSBundle loadGSMarkupNamed: @"MainMenu-OSX"  owner: [NSApp delegate]];
  #endif
   
  RELEASE (pool);
*/

  return NSApplicationMain (argc, argv);
}

