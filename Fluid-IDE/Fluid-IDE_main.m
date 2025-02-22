/* 
   Project: Fluid-IDE

   Author: miguel,,,

   Created: 2025-02-22 14:07:21 -0300 by miguel
*/

#import <Foundation/Foundation.h>


int 
main(int argc, const char *argv[])
{
// Uncomment if your application is Renaissance application
  CREATE_AUTORELEASE_POOL (pool);
  [NSApplication sharedApplication];
  [NSApp setDelegate: [AppController new]];

  #ifdef GNUSTEP
    [NSBundle loadGSMarkupNamed: @"MainMenu-GNUstep"  owner: [NSApp delegate]];
  #else
    [NSBundle loadGSMarkupNamed: @"MainMenu-OSX"  owner: [NSApp delegate]];
  #endif
   
  RELEASE (pool);

  return NSApplicationMain (argc, argv);
}

