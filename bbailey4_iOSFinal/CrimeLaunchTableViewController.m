//
//  CrimeLaunchTableViewController.m
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/31/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import "CrimeLaunchTableViewController.h"
#import "CrimeListTableViewController.h"

@interface CrimeLaunchTableViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation CrimeLaunchTableViewController

@synthesize latitudeLabel = _latitudeLabel;
@synthesize longitudeLabel = _longitudeLabel;

@synthesize locationManager = _locationManager;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (CLLocationManager *) locationManager
{
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 10;
    }
    return _locationManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationManager startUpdatingLocation];
    }
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.locationManager stopUpdatingLocation];
    [super viewWillDisappear:animated];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.latitudeLabel.frame = CGRectMake(83, 12, 150, 19);
    self.latitudeLabel.text = [[NSString alloc] initWithFormat:@"%f", ((CLLocation *)locations.lastObject).coordinate.latitude];
    self.longitudeLabel.frame = CGRectMake(83, 12, 150, 19);
    self.longitudeLabel.text = [[NSString alloc] initWithFormat:@"%f", ((CLLocation *)locations.lastObject).coordinate.longitude];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowCrimeListSegue"]) {
        if ([CLLocationManager locationServicesEnabled]) {
            [[segue destinationViewController] setMyLocation:self.locationManager.location];
        } else {
            CLLocation *myLocation = [[CLLocation alloc] initWithLatitude:41.83128
                                                                longitude:-87.62697];
            [[segue destinationViewController] setMyLocation:myLocation];
        }
        [[segue destinationViewController] setDistanceIndex:3];
        [[segue destinationViewController] setSearchDate:@"2013-03-10"];
    }
}

@end
