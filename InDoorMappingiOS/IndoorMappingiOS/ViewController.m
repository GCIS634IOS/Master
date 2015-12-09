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
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCoreLocation];
    [self setRegionToZurn];
    [self addOverlay];
    
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

- (void)addOverlay {
    
    self.building = [[Building alloc] initWithName:@"Zurn"];
    
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
