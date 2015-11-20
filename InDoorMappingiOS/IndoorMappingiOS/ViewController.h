//
//  ViewController.h
//  IndoorMappingiOS
//
//  Created by Alotaibi, Waleed N on 11/6/15.
//  Copyright © 2015 Alotaibi, Waleed N. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
@import CoreLocation;

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *indoorMap;

@property (weak, nonatomic) IBOutlet UILabel *currentLocationField;

// CoreLocation properties
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
