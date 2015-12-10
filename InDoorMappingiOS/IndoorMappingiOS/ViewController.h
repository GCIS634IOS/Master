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
#import "Building.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *indoorMap;

@property (weak, nonatomic) IBOutlet UILabel *currentLocationField;

// CoreLocation properties
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (nonatomic, strong) Building *building;

@property (nonatomic, retain) NSString* buildingName;

// Detail item to be used to configure the map with the floorplan
@property (strong, nonatomic) id detailItem;


@end
