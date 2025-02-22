#import "CustomTextView.h"

@implementation CustomTextView

- (void)textDidChange:(NSNotification *)notification {
  [super textDidChange:notification];
  [self highlightSyntax];
}

- (void)highlightSyntax {
  NSString *text = self.string;
  NSDictionary *defaultAttributes = [NSDictionary dictionaryWithObject:[NSColor blackColor] forKey:NSForegroundColorAttributeName];
  NSDictionary *keywordAttributes = [NSDictionary dictionaryWithObject:[NSColor blueColor] forKey:NSForegroundColorAttributeName];
  
  [self.textStorage beginEditing];
  [self.textStorage setAttributes:defaultAttributes range:NSMakeRange(0, text.length)];
  
  NSArray *keywords = [NSArray arrayWithObjects:@"int", @"float", @"double", @"if", @"else", @"for", @"while", @"return", nil];
  for (NSString *keyword in keywords) {
    NSRange searchRange = NSMakeRange(0, text.length);
    NSRange foundRange;
    while (searchRange.location < text.length) {
      searchRange.length = text.length - searchRange.location;
      foundRange = [text rangeOfString:keyword options:0 range:searchRange];
      if (foundRange.location != NSNotFound) {
        [self.textStorage setAttributes:keywordAttributes range:foundRange];
        searchRange.location = foundRange.location + foundRange.length;
      } else {
        break;
      }
    }
  }
  
  [self.textStorage endEditing];
}

@end
