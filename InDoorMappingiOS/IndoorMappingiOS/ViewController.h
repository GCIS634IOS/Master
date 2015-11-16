//
//  ViewController.h
//  IndoorMappingiOS
//
//  Created by Alotaibi, Waleed N on 11/6/15.
//  Copyright © 2015 Alotaibi, Waleed N. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *indoorMap;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *getCurrentLocation;
@property (weak, nonatomic) IBOutlet UILabel *currentLocationField;

@end
