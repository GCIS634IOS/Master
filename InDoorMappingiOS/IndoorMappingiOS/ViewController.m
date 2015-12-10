//
//  ViewController.m
//  IndoorMappingiOS
//
//  Created by Alotaibi, Waleed N on 11/6/15.
//  Copyright © 2015 Alotaibi, Waleed N. All rights reserved2.
//

#import "ViewController.h"
#import "MapOverlay.h"
#import "MapOverlayView.h"
#import "FloorPlanPDF.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.buildingName = [self.detailItem description];
        [self setRegion];
        [self addOverlay];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCoreLocation];
    [self configureView];
    
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

- (void)setRegion
{
    CLLocationCoordinate2D coord;
    
    NSArray *objectsPlist = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"GUBuildingsList" ofType:@"plist"]];
    
    int item = (int)[objectsPlist indexOfObject:self.buildingName];

    switch (item) {
  case 0:
    {
    //42.126920, -80.087162
    coord = CLLocationCoordinate2DMake(42.126920,-80.087162);
    }
    break;
    }
    
    CLLocationDistance distanceinMeters = 90;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, distanceinMeters , distanceinMeters);
    [self.indoorMap setRegion:region];

}

- (void)addOverlay {
    
    self.building = [[Building alloc] initWithName:self.buildingName];
    
    MapOverlay *overlay = [[MapOverlay alloc] initWithBuilding:self.building];
    
    [self.indoorMap addOverlay:overlay];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    
    MapOverlayView *overlayView = [[MapOverlayView alloc] initWithOverlay:overlay withBuilding:self.building];
    
    return overlayView;
    
}

- (void)readPDF
{
    FloorPlanPDF *newFloorMapReader = [FloorPlanPDF alloc];
    [newFloorMapReader initPDFwithFloorNum:3];
}
@end
