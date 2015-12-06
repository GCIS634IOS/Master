//
//  Building.m
//  IndoorMappingiOS
//
//  Created by Almushigih, Hadeel on 12/5/15.
//  Copyright © 2015 Alotaibi, Waleed N. All rights reserved.
//

#import "Building.h"

@implementation Building

- (instancetype)initWithName:(NSString *)name {
    
    self = [super init];
    
    if (self) {
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
        
        NSDictionary *properties = [NSDictionary dictionaryWithContentsOfFile:filePath];
        
        CGPoint midPoint = CGPointFromString(properties[@"centerCoord"]);
        
        _centerCoord = CLLocationCoordinate2DMake(midPoint.x, midPoint.y);
        
        CGPoint overlayTopLeftPoint = CGPointFromString(properties[@"overlayTopLeftCoord"]);
        
        _overlayTopLeftCoordinate = CLLocationCoordinate2DMake(overlayTopLeftPoint.x, overlayTopLeftPoint.y);
        
        CGPoint overlayTopRightPoint = CGPointFromString(properties[@"overlayTopRightCoord"]);
        
        _overlayTopRightCoordinate = CLLocationCoordinate2DMake(overlayTopRightPoint.x, overlayTopRightPoint.y);

        CGPoint overlayBottomLeftPoint = CGPointFromString(properties[@"overlayBottomLeftCoord"]);
        
        _overlayBottomLeftCoordinate = CLLocationCoordinate2DMake(overlayBottomLeftPoint.x, overlayBottomLeftPoint.y);
        
        CGPoint overlayBottomRightPoint = CGPointFromString(properties[@"overlayBottomRightCoord"]);
        
        _overlayBottomLeftCoordinate = CLLocationCoordinate2DMake(overlayBottomRightPoint.x, overlayBottomRightPoint.y);
        
    }
    
    return self;
    
}

- (MKMapRect)overlayBoundingMapRect {
    MKMapPoint topLeft = MKMapPointForCoordinate(self.overlayTopLeftCoordinate);
    MKMapPoint topRight = MKMapPointForCoordinate(self.overlayTopRightCoordinate);
    MKMapPoint bottomLeft = MKMapPointForCoordinate(self.overlayBottomLeftCoordinate);
    
    return MKMapRectMake(topLeft.x,
                         topLeft.y,
                         fabs(topLeft.x - topRight.x),
                         fabs(topLeft.y - bottomLeft.y));
    
}


@end
