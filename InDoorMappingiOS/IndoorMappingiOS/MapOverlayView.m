//
//  MapOverlayView.m
//  IndoorMappingiOS
//
//  Created by Hadeel Almushigih on 12/5/15.
//  Copyright © 2015 Alotaibi, Waleed N. All rights reserved.
//

#import "MapOverlayView.h"


@implementation MapOverlayView

- (instancetype)initWithOverlay:(id<MKOverlay>)overlay withBuilding:(Building *)building {
    self = [super initWithOverlay:overlay];
    if (self) {
        self.building = building;
    }
    
    return self;
}

-(void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)context
{
    UIImage *overlayImage = [UIImage imageNamed:@"Floor_3"];
    
    CGImageRef imageReference = overlayImage.CGImage;
    
    MKMapRect theMapRect = self.building.overlayBoundingMapRect;
    
    CGRect theRect = [self rectForMapRect:theMapRect];
    
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0.0, -theRect.size.height);
    CGContextDrawImage(context, theRect, imageReference);

}

@end
