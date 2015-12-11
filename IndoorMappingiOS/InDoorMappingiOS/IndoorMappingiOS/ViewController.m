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

//coordinates for room 322: 42.127207, -80.087615

@interface ViewController ()

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegmentedControl;
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
        self.building = [[Building alloc] initWithName:[self.detailItem description]];
        self.building.floorNum = @"First";
//        self.building.buildingName = [self.detailItem description];
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

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation* currentLocation;
    currentLocation = [locations lastObject];
    // here we get the current location
}

- (void)setRegion
{
    CLLocationCoordinate2D coord;
    
    NSArray *objectsPlist = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"GUBuildingsList" ofType:@"plist"]];
    
    int item = (int)[objectsPlist indexOfObject:self.building.buildingName];

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

- (void)showRoom:(CLLocationCoordinate2D *)coordinate room: (NSString*)roomNum
{
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(*coordinate, 90, 90);
//    [self.indoorMap setRegion:[self.indoorMap regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = *(coordinate);
    point.title = roomNum;
    
    [self.indoorMap addAnnotation:point];

}

-(IBAction)searchRoom:(id)sender{
    CLLocationCoordinate2D coordinate;
    
    if([self.roomNumberToSearch.text isEqual:@"322"]){
        //display the coordinate point for this room
        coordinate = CLLocationCoordinate2DMake(42.127207, -80.087615);
        [self showRoom:&coordinate room:self.roomNumberToSearch.text];
    }
    else if([self.roomNumberToSearch.text isEqual:@"354"]){
        //these coordinates are actually for 353 but don't align with current image
        coordinate = CLLocationCoordinate2DMake(42.126525, -80.087146);
        [self showRoom:&coordinate room:self.roomNumberToSearch.text];
    }
}

- (void)updateView
{
    [self setRegion];
    [self addOverlay];
}


- (IBAction)mySegmentedControlAction:(id)sender {
    switch (self.mySegmentedControl.selectedSegmentIndex) {
        case 0:
            self.building.floorNum = [self.mySegmentedControl titleForSegmentAtIndex:self.mySegmentedControl.selectedSegmentIndex];
            
            break;
        case 1:
            self.building.floorNum = [self.mySegmentedControl titleForSegmentAtIndex:self.mySegmentedControl.selectedSegmentIndex];
            break;
        case 2:
            self.building.floorNum = [self.mySegmentedControl titleForSegmentAtIndex:self.mySegmentedControl.selectedSegmentIndex];
            break;
        case 3:
            self.building.floorNum = [self.mySegmentedControl titleForSegmentAtIndex:self.mySegmentedControl.selectedSegmentIndex];
            break;
    }
    
    [self updateView];
}

@end
