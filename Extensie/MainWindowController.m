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
    //[window orderOut:nil];
    [window setIsVisible:false];
}

- (void)showWindow: (NSWindow *)window {
    [window setIsVisible:true];
    [self.window setLevel:NSFloatingWindowLevel];
    //[window makeKeyAndOrderFront:nil];
    //[window setLevel:NSStatusWindowLevel];
    //[NSApp activateIgnoringOtherApps:YES];
}

- (void)attachToMousePosition {
    NSScreen *screen = [NSScreen mainScreen];
    NSPoint pos = [NSEvent mouseLocation];
    CGRect position = self.window.frame;
    position.origin.x = pos.x + 10;
    position.origin.y = pos.y - self.window.frame.size.height - 10;
    float notchWidth = 200;
    float notchHeight = 30;
    if (pos.x > screen.frame.size.width / 2 - notchWidth / 2 && pos.x < screen.frame.size.width / 2 + notchWidth / 2 && pos.y > screen.frame.size.height - notchHeight) {
        [self.window setFrameOrigin: position.origin];
        [self showWindow: self.window];
    } else {
        [self hideWindow: self.window];
    }
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


@end
