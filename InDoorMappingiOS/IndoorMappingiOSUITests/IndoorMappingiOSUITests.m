//
//  IndoorMappingiOSUITests.m
//  IndoorMappingiOSUITests
//
//  Created by Alotaibi, Waleed N on 11/6/15.
//  Copyright © 2015 Alotaibi, Waleed N. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface IndoorMappingiOSUITests : XCTestCase

@end

@implementation IndoorMappingiOSUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample {
//    // Use recording to get started writing UI tests.
//    // Use XCTAssert and related functions to verify your tests produce the correct results.
//    
//    XCUIApplication *app = [[XCUIApplication alloc] init];
//    XCUIElement *indoormappingiosIcon = app.scrollViews.otherElements.icons[@"IndoorMappingiOS"];
//    [indoormappingiosIcon tap];
//    [app.alerts[@"Allow \U201cIndoorMappingiOS\U201d to access your location while you use the app?"].collectionViews.buttons[@"Allow"] tap];
//    [indoormappingiosIcon tap];
//    [indoormappingiosIcon tap];
//    
//}
- (void)testExample{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *map = [[[[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Indoor Map"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeMap].element;
    [map tap];
    [map tap];
    [map tap];
    [app.navigationBars[@"Indoor Map"].buttons[@"Refresh"] tap];
    
}



@end
