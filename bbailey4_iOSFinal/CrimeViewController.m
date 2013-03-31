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

@end

@implementation CrimeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

@end
