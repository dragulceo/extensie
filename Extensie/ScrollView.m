//
//  ScrollView.m
//  Extensie
//
//  Created by Tavi on 10/29/21.
//

#import "ScrollView.h"

@implementation ScrollView

NSTrackingArea *trackingArea;
CGPoint origin;


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    //[[glView window] setAcceptsMouseMovedEvents:YES];
}

- (void)updateTrackingAreas {
//    NSScreen *screen = [NSScreen mainScreen];
//    [self removeTrackingArea:trackingArea];
//    trackingArea = [[NSTrackingArea alloc] initWithRect:screen.frame
//        options: (NSTrackingMouseMoved | NSTrackingActiveAlways)
//        owner:self userInfo:nil];
//    [self addTrackingArea:trackingArea];
}

- (void)initTrackingArea {
    if (self) {
        if (trackingArea != nil) {
            [self updateTrackingAreas];
        } else {
            self.automaticallyAdjustsContentInsets = YES;
            //self.contentInsets = NSEdgeInsetsMake(0, 0, 0, 0);
            [NSTimer scheduledTimerWithTimeInterval:0.016
                                                 target:self
                                               selector:@selector(theAction)
                                               userInfo:nil
                                                repeats:YES];
            NSScreen *screen = [NSScreen mainScreen];
            trackingArea = [[NSTrackingArea alloc] initWithRect:screen.frame
                options: (NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingActiveInKeyWindow )
                owner:self userInfo:nil];
            [self addTrackingArea:trackingArea];
        }
    }
}

NSPoint prevPos;

- (void) drawScreen {

    NSPoint pos = [NSEvent mouseLocation];
    
    if (fabs(pos.x - prevPos.x) < 0.1 && fabs(pos.y - prevPos.y) < 0.1) {
        return;
    }
    prevPos = pos;
    
    NSScreen *screen = [NSScreen mainScreen];
    CGRect menu = CGRectMake(0, 0, screen.frame.size.width, 30);

    CGImageRef screenShot = CGWindowListCreateImage(menu, kCGWindowListOptionOnScreenOnly, kCGNullWindowID, kCGWindowImageDefault);
    
    NSBitmapImageRep *bitmapRep = [[NSBitmapImageRep alloc] initWithCGImage:screenShot];
    // Create an NSImage and add the bitmap rep to it...
    NSImage *image = [[NSImage alloc] init];
    [image addRepresentation:bitmapRep];
    bitmapRep = nil;
    
    CFRelease(screenShot);
    
    //NSBitmapImageRep* bitmap = [self bitmapImageRepForCachingDisplayInRect:screen.frame];
    //NSDictionary *imageProps = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:0.9] forKey:NSImageCompressionFactor];
    //NSData *imageData = [bitmap representationUsingType:NSPNGFileType properties:imageProps];
    CGRect fullFrame = screen.frame;
    CGRect frame = screen.frame;
    //fullFrame.size = image.size;
    
    fullFrame.origin.y = self.frame.size.height - self.frame.size.height * 2;
    if (fullFrame.origin.y < -screen.frame.size.height + self.frame.size.height * 1) {
        //factor = 1.0;
    }
    //frame.size.height = frame.size.height + self.frame.size.height * 2;
    //fullFrame.size.width = fullFrame.size.width + self.frame.size.width * factor;
    self.imageViewItem.frame = fullFrame;
    self.imageViewItem.image.backgroundColor = [NSColor redColor];
    //self.imageViewItem.image.size = screen.frame.size;
    self.imageViewItem.image = image; //[[NSImage alloc] initWithData: imageData];
    //self.contentView.frame = screen.frame;
    
    
    frame.origin.x = -pos.x + self.frame.size.width / 2;
    //frame.origin.y = -screen.frame.size.height + pos.y - self.frame.size.height / 2;
    frame.origin.y = -screen.frame.size.height / 2  - self.frame.size.height / 2;
//    if (frame.origin.y > -self.frame.size.height) {
//        frame.origin.y = -self.frame.size.height;
//    }
////    if (frame.origin.y < -screen.frame.size.height + self.frame.size.height * 1) {
////        frame.origin.y = -screen.frame.size.height + self.frame.size.height * 1;
////    }
    if (frame.origin.x > 0) {
        frame.origin.x = 0;
    }
    if (frame.origin.x < -screen.frame.size.width + self.frame.size.width * 1) {
        frame.origin.x = -screen.frame.size.width + self.frame.size.width * 1;
    }
    
    self.contentView.frame = frame;
    
    //NSLog(@"asddada");
    
//    NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:screen.frame
//        options: (NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingActiveInKeyWindow )
//        owner:self userInfo:nil];
//    [self addTrackingArea:trackingArea];
//    NSView *aaa = [[NSView alloc] initWithFrame:  ]
}

-(void) theAction {
 // NSLog(@"Will appear after a 2 second delay.");
//    NSPoint pos = [NSEvent mouseLocation];
//    NSLog(@"%f %f", pos.x, pos.y);
//    pos.x = pos.x - self.frame.size.width/2;
//    pos.y = pos.y - self.frame.size.height/2;
//    //origin.x = pos.x;
//    //origin.y = pos.y;
//
//    //[[self contentView] scrollToPoint:pos];
//
//    NSScreen *screen = [NSScreen mainScreen];
//    //CGRect currentFrame = screen.frame;
//    CGRect currentFrame = self.contentView.frame;
//    CGPoint point = currentFrame.origin;
//    //point.x = -pos.x;
//    //point.y = -pos.y;
//    //currentFrame.origin = point;
//    //self.contentView.frame = currentFrame;
    [self drawScreen];
    //[[self contentView] drawRect: self.contentView.frame];
    //[self reflectScrolledClipView: [self contentView]];
    //[self.contentView setNeedsDisplay:TRUE]
    //[self drawRect:self.frame];
    //[self setNeedsDisplay:TRUE];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    [self initTrackingArea];
    return self;
}

- (id)init {
    self = [super init];
    [self initTrackingArea];
    return self;
}

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    [self initTrackingArea];
    return self;
}

- (void)mouseMoved:(NSEvent *)theEvent {
    //[self drawScreen];
}

@end
