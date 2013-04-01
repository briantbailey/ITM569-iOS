//
//  CrimeViewController.m
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/26/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import "CrimeViewController.h"
#import "CrimeListTableViewController.h"

@interface CrimeViewController ()

@property (strong, nonatomic) UIView *distanceView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation CrimeViewController

@synthesize locationManager = _locationManager;

@synthesize pickerData = _pickerData;
@synthesize pickerView = _pickerView;
@synthesize distanceView = _distanceView;

@synthesize latitudeLabel = _latitudeLabel;
@synthesize longitudeLabel = _longitudeLabel;

- (NSArray *) pickerData
{
    if (_pickerData == nil) {
        _pickerData = [[NSArray alloc] initWithObjects:@"one", @"two", @"three", nil];
    }
    return _pickerData;
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
	// Do any additional setup after loading the view, typically from a nib.
    _pickerView = [[UIPickerView alloc]init];
    [self.pickerView setDataSource:self];
    [self.pickerView setDelegate:self];
    self.pickerView.frame = CGRectMake(0, 44, 320, 216);
    self.pickerView.showsSelectionIndicator = YES;
    [self.pickerView selectRow:1 inComponent:0 animated:YES];
    
    _distanceView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, 260)];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(closeDistanceView)];
    [toolbar setItems:[[NSArray alloc] initWithObjects:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],barButton, nil]];
    
    [self.distanceView addSubview:toolbar];
    [self.distanceView addSubview:self.pickerView];
    
    [self.view addSubview: self.distanceView];
    
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
    //NSLog(@"Location: %f", ((CLLocation *)locations.lastObject).coordinate.latitude);
    self.latitudeLabel.text = [[NSString alloc] initWithFormat:@"%f", ((CLLocation *)locations.lastObject).coordinate.latitude];
    self.longitudeLabel.text = [[NSString alloc] initWithFormat:@"%f", ((CLLocation *)locations.lastObject).coordinate.longitude];
}

- (void) closeDistanceView
{
    [UIView animateWithDuration:0.5 animations:^{
        self.distanceView.frame = CGRectMake(0, self.view.frame.size.height, 320, 260);
    }];

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.pickerData count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.pickerData objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowCrimeListSegue"]) {
        CLLocation *myLocation = [[CLLocation alloc] initWithLatitude:41.83128
                                                            longitude:-87.62697];
        [[segue destinationViewController] setMyLocation:myLocation];
        [[segue destinationViewController] setDistanceIndex:3];
        [[segue destinationViewController] setSearchDate:@"2013-03-10"];
    }
}

- (IBAction)showNewSubview:(UIButton *)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.distanceView.frame = CGRectMake(0, (self.view.frame.size.height - 260), 320, 260);
    }];

}
@end
