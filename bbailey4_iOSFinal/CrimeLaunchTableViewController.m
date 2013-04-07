//
//  CrimeLaunchTableViewController.m
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/31/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import "CrimeLaunchTableViewController.h"
#import "CrimeListTableViewController.h"
#import "CrimeDistanceSelectViewController.h"
#import "CrimeDateSelectViewController.h"

@interface CrimeLaunchTableViewController () <CrimeDistanceSelectViewControllerDelegate, CrimeDateSelectViewControllerDelegate>

@property (copy, nonatomic) NSArray *distanceArray;
@property (copy, nonatomic) NSArray *dateArray;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (nonatomic) NSUInteger selectedDistanceIndex;
@property (nonatomic) NSUInteger selectedDateIndex;

@end

@implementation CrimeLaunchTableViewController

@synthesize latitudeLabel = _latitudeLabel;
@synthesize longitudeLabel = _longitudeLabel;
@synthesize distanceLabel = _distanceLabel;
@synthesize dateLabel = _dateLabel;

@synthesize locationManager = _locationManager;
@synthesize distanceArray = _distanceArray;
@synthesize selectedDistanceIndex = _selectedDistanceIndex;
@synthesize selectedDateIndex = _selectedDateIndex;

- (NSArray *)distanceArray
{
    if (_distanceArray == nil) {
        _distanceArray = [[NSArray alloc] initWithObjects:@"100 Feet", @"250 Feet", @"500 Feet", @"1000 Feet", @"\u00BC Mile", @"\u00bd Mile", @"1 Mile", nil];
    }
    return _distanceArray;
}

- (NSArray *)dateArray
{
    if (_dateArray == nil) {
        _dateArray = [[NSArray alloc] initWithObjects:@"in Last 2 Weeks", @"in Last Month", @"in Last 2 Months", @"in Last 6 Months", @"in Last Year", nil];
    }
    return _dateArray;
}

- (void)setSelectedDistanceIndex:(NSUInteger)selectedDistanceIndex
{
    _selectedDistanceIndex = selectedDistanceIndex;
}

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
    
    self.selectedDistanceIndex = 2;
    self.selectedDateIndex = 1;
    self.distanceLabel.text = [self.distanceArray objectAtIndex:self.selectedDistanceIndex];
    self.dateLabel.text = [self.dateArray objectAtIndex:self.selectedDateIndex];
    
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

- (void)crimeDistanceViewController:(CrimeDistanceSelectViewController *)sender didSelectDistanceIndex:(NSUInteger)index
{
    self.selectedDistanceIndex = index;
    self.distanceLabel.text = [self.distanceArray objectAtIndex:self.selectedDistanceIndex];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)crimeDateSelectViewController:(CrimeDateSelectViewController *)sender didSelectDateIndex:(NSUInteger)index
{
    self.selectedDateIndex = index;
    self.dateLabel.text = [self.dateArray objectAtIndex:self.selectedDateIndex];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)getDateStringFromSelectedIndex:(NSUInteger)index
{
    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDateString = @"";
    NSDate *newDate;
    switch (index) {
        case 0:
            [dateComponents setDay:-14];
            newDate = [cal dateByAddingComponents:dateComponents toDate:now options:0];
            formattedDateString = [dateFormatter stringFromDate:newDate];
            break;
            
        case 1:
            [dateComponents setMonth:-1];
            newDate = [cal dateByAddingComponents:dateComponents toDate:now options:0];
            formattedDateString = [dateFormatter stringFromDate:newDate];
            break;
            
        case 2:
            [dateComponents setMonth:-2];
            newDate = [cal dateByAddingComponents:dateComponents toDate:now options:0];
            formattedDateString = [dateFormatter stringFromDate:newDate];
            break;
            
        case 3:
            [dateComponents setMonth:-6];
            newDate = [cal dateByAddingComponents:dateComponents toDate:now options:0];
            formattedDateString = [dateFormatter stringFromDate:newDate];
            break;
            
        case 4:
            [dateComponents setMonth:-12];
            newDate = [cal dateByAddingComponents:dateComponents toDate:now options:0];
            formattedDateString = [dateFormatter stringFromDate:newDate];
            break;
            
        default:
            break;
    }
    return formattedDateString;
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
        [[segue destinationViewController] setDistanceIndex:self.selectedDistanceIndex];
        [[segue destinationViewController] setSearchDate:[self getDateStringFromSelectedIndex:self.selectedDateIndex]];
    }
    
    if ([[segue identifier] isEqualToString:@"ShowDistanceSelect"]) {
        CrimeDistanceSelectViewController *dsvc = (CrimeDistanceSelectViewController *)segue.destinationViewController;
        //Other Setup
        dsvc.distanceArray = self.distanceArray;
        dsvc.selectedRow = self.selectedDistanceIndex;
        dsvc.delegate = self;
    }
    
    if ([[segue identifier] isEqualToString:@"ShowDateSelect"]) {
        CrimeDateSelectViewController *dsvc = (CrimeDateSelectViewController *)segue.destinationViewController;
        //Other Setup
        dsvc.dateArray = self.dateArray;
        dsvc.selectedRow = self.selectedDateIndex;
        dsvc.delegate = self;
    }
}

@end
