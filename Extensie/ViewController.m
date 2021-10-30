//
//  ViewController.m
//  Extensie
//
//  Created by Tavi on 10/28/21.
//

#import "ViewController.h"

@implementation ViewController

//- (NSImage *)screenCap {
////    NSBitmapImageRep *bitmap = [self bitmapImageRepForCachingDisplayInRect:self.bounds];
////    [self cacheDisplayInRect:self.bounds toBitmapImageRep:bitmap];
////    NSImage *result = [[NSImage alloc] initWithSize:self.bounds.size];
////    [result addRepresentation:bitmap];
////    return result;
//    NSBitmapImageRep *bitmap =  = [self.view bitmapImageRepForCachingDisplayInRect[self.view.bounds]]
//
////            self.view.cacheDisplayInRect(self.view.bounds, toBitmapImageRep: rep)
////            let image: NSImage = NSImage()
////            image.addRepresentation(rep)
////
//    NSImage *image = NSImage();
//    return image;
//}

- (void)drawScreen {

}

- (void)viewDidLoad {
    [super viewDidLoad];
//    CGRect frame = self.view.frame;
//    frame.origin.x = -2;
//    self.view.frame = frame;
    [self drawScreen];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
    [self drawScreen];
}

-(void)viewWillAppear {
    [super viewWillAppear];
    [self drawScreen];
}



@end
