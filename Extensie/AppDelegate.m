//
//  AppDelegate.m
//  Extensie
//
//  Created by Tavi on 10/28/21.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property NSStatusItem *barItem;
@property bool visible;
@property NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.visible = true;
    // Insert code here to initialize your application
    self.barItem = [NSStatusBar.systemStatusBar statusItemWithLength:NSVariableStatusItemLength];
    self.barItem.button.title = @"🚀";
    self.barItem.button.image = [NSImage imageNamed:@"Icon"];
    [self.barItem.button setAction:@selector(barItemAction)];
    NSMenu *menu = [[NSMenu alloc] initWithTitle:@"Main menu"];
    NSMenuItem *menuItem = [[NSMenuItem alloc] initWithTitle:@"Exit" action:@selector(exit) keyEquivalent:@"q"];
    [menu addItem:menuItem];
    self.barItem.menu = menu;
}

- (void)exit {
    NSLog(@"exit");
    [NSApplication.sharedApplication terminate:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


-(void)barItemAction {
    if (self.window == nil) {
        self.window =NSApplication.sharedApplication.mainWindow;
    }

    if (!self.visible) {
        [self.window makeKeyAndOrderFront:nil];
        [self.window setLevel:NSStatusWindowLevel];
        [NSApp activateIgnoringOtherApps:YES];
        self.visible = true;
    } else {
        [self.window orderOut:nil];
        self.visible = false;
    }
}
@end
