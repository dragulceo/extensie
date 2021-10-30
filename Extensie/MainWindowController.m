//
//  MainWindowController.m
//  Extensie
//
//  Created by Tavi on 10/30/21.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (void)hideWindow: (NSWindow *)window {
    [window orderOut:nil];
}

- (void)showWindow: (NSWindow *)window {
    [window makeKeyAndOrderFront:nil];
    [window setLevel:NSStatusWindowLevel];
    [NSApp activateIgnoringOtherApps:YES];
}

- (void)attachToMousePosition {
    NSScreen *screen = [NSScreen mainScreen];
    NSPoint pos = [NSEvent mouseLocation];
    CGRect position = self.window.frame;
    position.origin.x = pos.x + 10;
    position.origin.y = pos.y - self.window.frame.size.height - 10;
    if (pos.x > 1000 && pos.x < 1200 && pos.y > screen.frame.size.height - 30) {
        [self.window setFrameOrigin: position.origin];
        [self showWindow: self.window];
    } else {
        [self hideWindow: self.window];
    }
    //[self.window setFrameOrigin: position.origin];
}


- (void)windowDidLoad {
    [super windowDidLoad];
    
    [self attachToMousePosition];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.

    [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskMouseMoved handler:^(NSEvent *event){
        [self attachToMousePosition];
    }];
    [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskMouseMoved handler:^(NSEvent *event){
        [self attachToMousePosition];
        return event;
    }];
    [self hideWindow: self.window];
}


//




@end
