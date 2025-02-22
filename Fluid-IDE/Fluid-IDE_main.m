#import <AppKit/AppKit.h>
#import "CustomTextView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSOpenSavePanelDelegate> {
  NSWindow *_window;
  CustomTextView *_textView;
  NSTextField *_statusBar;
}
@property (retain) NSWindow *window;
@property (retain) CustomTextView *textView;
@property (retain) NSTextField *statusBar;
@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize textView = _textView;
@synthesize statusBar = _statusBar;

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
  NSRect windowRect = NSMakeRect(100, 100, 800, 600);
  // Use GNUstep style mask macros
  self.window = [[NSWindow alloc] initWithContentRect:windowRect
                                            styleMask:(NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask)
                                              backing:NSBackingStoreBuffered
                                                defer:NO];
  self.window.title = @"Fluid IDE";
  
  NSMenu *mainMenu = [[NSMenu alloc] initWithTitle:@"MainMenu"];
  NSMenuItem *appMenuItem = [[NSMenuItem alloc] initWithTitle:@"Fluid IDE" action:NULL keyEquivalent:@""];
  [mainMenu addItem:appMenuItem];
  
  NSMenu *appMenu = [[NSMenu alloc] initWithTitle:@"Fluid IDE"];
  NSMenuItem *infoMenuItem = [[NSMenuItem alloc] initWithTitle:@"Info" action:@selector(showInfoPanel) keyEquivalent:@"i"];
  [appMenu addItem:infoMenuItem];
  NSMenuItem *quitMenuItem = [[NSMenuItem alloc] initWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"q"];
  [appMenu addItem:quitMenuItem];
  [appMenuItem setSubmenu:appMenu];
  
  [NSApp setMainMenu:mainMenu];
  
  NSToolbar *toolbar = [[NSToolbar alloc] initWithIdentifier:@"Toolbar"];
  toolbar.delegate = self;
  self.window.toolbar = toolbar;
  
  NSScrollView *scrollView = [[NSScrollView alloc] initWithFrame:[(NSView *)self.window.contentView bounds]];
  scrollView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
  
  self.textView = [[CustomTextView alloc] initWithFrame:[(NSView *)self.window.contentView bounds]];
  self.textView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
  self.textView.minSize = NSMakeSize(0.0, [(NSView *)self.window.contentView bounds].size.height);
  self.textView.maxSize = NSMakeSize(FLT_MAX, FLT_MAX);
  self.textView.verticallyResizable = YES;
  self.textView.horizontallyResizable = NO;
  
  scrollView.documentView = self.textView;
  [self.window.contentView addSubview:scrollView];
  
  NSRect statusBarRect = NSMakeRect(0, 0, [(NSView *)self.window.contentView bounds].size.width, 20);
  self.statusBar = [[NSTextField alloc] initWithFrame:statusBarRect];
  self.statusBar.autoresizingMask = NSViewWidthSizable | NSViewMinYMargin;
  self.statusBar.stringValue = @"Ready";
  self.statusBar.editable = NO;
  self.statusBar.bezeled = NO;
  self.statusBar.drawsBackground = NO;
  [self.window.contentView addSubview:self.statusBar];
  
  [self.window makeKeyAndOrderFront:nil];
  [NSApp activateIgnoringOtherApps:YES];
}

- (void)showInfoPanel {
  NSAlert *alert = [[NSAlert alloc] init];
  alert.messageText = @"Info";
  alert.informativeText = @"This is a simple IDE application.";
  [alert addButtonWithTitle:@"OK"];
  [alert runModal];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(id)sender {
  return YES;
}

// Toolbar delegate methods
- (NSArray *)toolbarAllowedItemIdentifiers:(NSToolbar *)toolbar {
  return [NSArray arrayWithObjects:@"New", @"Open", @"Save", nil];
}

- (NSArray *)toolbarDefaultItemIdentifiers:(NSToolbar *)toolbar {
  return [NSArray arrayWithObjects:@"New", @"Open", @"Save", nil];
}

- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSString *)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag {
  NSToolbarItem *item = [[NSToolbarItem alloc] initWithItemIdentifier:itemIdentifier];
  if ([itemIdentifier isEqualToString:@"New"]) {
    item.label = @"New";
    item.image = [NSImage imageNamed:@"NSAddTemplate"];
    item.target = self;
    item.action = @selector(newFile:);
  } else if ([itemIdentifier isEqualToString:@"Open"]) {
    item.label = @"Open";
    item.image = [NSImage imageNamed:@"NSFolder"];
    item.target = self;
    item.action = @selector(openFile:);
  } else if ([itemIdentifier isEqualToString:@"Save"]) {
    item.label = @"Save";
    item.image = [NSImage imageNamed:@"NSPathTemplate"];
    item.target = self;
    item.action = @selector(saveFile:);
  }
  return item;
}

// Toolbar actions
- (void)newFile:(id)sender {
  self.textView.string = @"";
  self.statusBar.stringValue = @"New file created";
}

- (void)openFile:(id)sender {
  NSOpenPanel *openPanel = [NSOpenPanel openPanel];
  openPanel.delegate = self;
  [openPanel beginSheetForDirectory:nil file:nil types:nil modalForWindow:self.window modalDelegate:self didEndSelector:@selector(openPanelDidEnd:returnCode:contextInfo:) contextInfo:nil];
}

- (void)openPanelDidEnd:(NSOpenPanel *)panel returnCode:(int)returnCode contextInfo:(void *)contextInfo {
  if (returnCode == NSOKButton) {
    NSURL *fileURL = [panel URL];
    NSError *error = nil;
    NSString *fileContents = [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:&error];
    if (error) {
      NSLog(@"Error reading file: %@", error);
    } else {
      self.textView.string = fileContents;
      self.statusBar.stringValue = [NSString stringWithFormat:@"Opened file: %@", fileURL.path];
    }
  }
}

- (void)saveFile:(id)sender {
  NSSavePanel *savePanel = [NSSavePanel savePanel];
  savePanel.delegate = self;
  [savePanel beginSheetForDirectory:nil file:nil modalForWindow:self.window modalDelegate:self didEndSelector:@selector(savePanelDidEnd:returnCode:contextInfo:) contextInfo:nil];
}

- (void)savePanelDidEnd:(NSSavePanel *)panel returnCode:(int)returnCode contextInfo:(void *)contextInfo {
  if (returnCode == NSOKButton) {
    NSURL *fileURL = [panel URL];
    NSError *error = nil;
    NSString *fileContents = self.textView.string;
    [fileContents writeToURL:fileURL atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (error) {
      NSLog(@"Error writing file: %@", error);
    } else {
      self.statusBar.stringValue = [NSString stringWithFormat:@"Saved file: %@", fileURL.path];
    }
  }
}

@end

int main(int argc, const char * argv[]) {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  NSApplication *app = [NSApplication sharedApplication];
  AppDelegate *delegate = [[AppDelegate alloc] init];
  app.delegate = delegate;
  [app run];
  [pool drain];
  return EXIT_SUCCESS;
}
