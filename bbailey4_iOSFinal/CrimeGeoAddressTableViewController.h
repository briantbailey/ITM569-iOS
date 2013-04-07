//
//  CrimeGeoAddressTableViewController.h
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 4/6/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CrimeGeoAddressTableViewController : UITableViewController

@property (copy, nonatomic) NSMutableArray *addressArray;

@property (copy, nonatomic) NSString *geoAddressString;
@property (nonatomic) NSUInteger distanceIndex;
@property (copy, nonatomic) NSString *searchDate;

- (void)geoCodeAddress:(NSString *)addressString;
@end
