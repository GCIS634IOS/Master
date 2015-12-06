//
//  ViewController.m
//  IndoorMappingiOS
//
//  Created by Alotaibi, Waleed N on 11/6/15.
//  Copyright © 2015 Alotaibi, Waleed N. All rights reserved2.
//

#import "ViewController.h"
#import "Building.h"

#import "FloorPlanPDF.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCoreLocation];
    [self setRegionToZurn];
    [self readPDF];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)refreshRegion:(id)sender {
    
    [self viewDidLoad];
}

- (void)initCoreLocation
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager  requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (void)setRegionToZurn
{
    //42.126920, -80.087162
    CLLocationCoordinate2D zurnCoord = {.latitude =  42.126920, .longitude =  -80.087162};

    CLLocationDistance distanceinMeters = 90;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(zurnCoord, distanceinMeters , distanceinMeters);

    [self.indoorMap setRegion:region];

}
-(void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)context
{
    
}

- (void)readPDF
{
    FloorPlanPDF *newFloorMapReader = [FloorPlanPDF alloc];
    [newFloorMapReader initPDFwithFloorNum:3];
}
@end
