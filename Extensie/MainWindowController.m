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


- (void)attachToMousePosition {
    NSScreen *screen = [NSScreen mainScreen];
    NSPoint pos = [NSEvent mouseLocation];
    CGRect position = self.window.frame;
    position.origin.x = pos.x + 10;
    position.origin.y = pos.y - self.window.frame.size.height - 10;
    [self.window setFrameOrigin: position.origin];

}


- (void)windowDidLoad {
    [super windowDidLoad];
    
    [self attachToMousePosition];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    
    
    //self.window. = position;
//    NSTrackingArea trackingArea = [[NSTrackingArea alloc] initWithRect:screen.frame
//        options: (NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingActiveInKeyWindow )
//        owner:self userInfo:nil];
//    [self addTrackingArea:trackingArea];
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskMouseMoved handler:^(NSEvent *event){
//        NSPoint pos = [NSEvent mouseLocation];
//        NSLog(@"global: %f %f", [NSEvent mouseLocation].x, [NSEvent mouseLocation].y);
//        CGRect position = self.window.frame;
//        position.origin.x = pos.x + 10;
//        position.origin.y = pos.y - self.window.frame.size.height - 10;
//        //[self.window setFrameOrigin: position.origin];
//        [self.window setFrame:position display:FALSE];
        [self attachToMousePosition];
    }];
    [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskMouseMoved handler:^(NSEvent *event){
//        NSPoint pos = [NSEvent mouseLocation];
//        NSLog(@"local: %f %f", [NSEvent mouseLocation].x, [NSEvent mouseLocation].y);
//        CGRect position = self.window.frame;
//        //position.origin.x = pos.x + 10;
//        position.origin.x = pos.x + 10;
//        position.origin.y = pos.y - self.window.frame.size.height - 10;
//        //[self.window setFrameOrigin: position.origin];
//        [self.window setFrame:position display:FALSE];
//        //self.window.contentView.frame = position;
//
//        //[self.window close];
//        //[self.window setFrameTopLeftPoint:pos];
//        //[self showWindow: self.window];
        [self attachToMousePosition];
        return event;
    }];
}

@end
