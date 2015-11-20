//
//  FloorMapReader.h
//  IndoorMappingiOS
//
//  Created by Almushigih, Hadeel on 11/20/15.
//  Copyright © 2015 Alotaibi, Waleed N. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreGraphics;

@interface FloorMapReader : NSObject

- (void)initURL:(int)floorNum;
- (void)openPDF:(NSURL*)nsurl;

@end
