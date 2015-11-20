//
//  FloorMapReader.m
//  IndoorMappingiOS
//
//  Created by Almushigih, Hadeel on 11/20/15.
//  Copyright © 2015 Alotaibi, Waleed N. All rights reserved.
//

#import "FloorMapReader.h"

@implementation FloorMapReader


- (void)initURL:(int)floorNum
{
    NSString *floorNumber = @"";
    
        switch (floorNum)
    {
            case 1:
                floorNumber = @"";
                NSLog (@"First Floor");
                break;
                
            case 2:
                floorNumber = @"";
                NSLog (@"Second Floor");
                break;
                
            case 3:
                floorNumber = @"Floor_3";
                NSLog (@"Third Floor");
                break;
                
            case 4:
                floorNumber = @"";
                NSLog (@"Fourth Floor");
                break;
    }
    
    NSURL *pdfUrl = [[NSBundle mainBundle] URLForResource:floorNumber withExtension:@"pdf" subdirectory:@"FloorPlan"];
    
    [ self openPDF:pdfUrl];

}

- (void)openPDF:(NSURL*)nsurl
{
    CGPDFDocumentRef myDocument;
    
    CFURLRef url = (__bridge CFURLRef)nsurl;
    
    myDocument = CGPDFDocumentCreateWithURL(url);// 1
    
    if (myDocument == NULL){// 2
        NSLog(@"cannt open");
        CFRelease (url);
    }
    CFRelease (url);
}

@end
