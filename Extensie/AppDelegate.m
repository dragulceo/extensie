//
//  AppDelegate.m
//  Extensie
//
//  Created by Tavi on 10/28/21.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property NSStatusItem *barItem ;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.barItem = [NSStatusBar.systemStatusBar statusItemWithLength:NSVariableStatusItemLength];
    self.barItem.button.title = @"🚀";
    [self.barItem setAction:@selector(barItemAction)];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

-(void)barItemAction {
    NSLog(@"🚀 button was clicked ");
}
@end
