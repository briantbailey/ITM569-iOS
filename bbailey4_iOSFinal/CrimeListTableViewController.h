//
//  CrimeListTableViewController.h
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/29/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class CrimeRecordDataController;
@interface CrimeListTableViewController : UITableViewController

@property (strong, nonatomic) CrimeRecordDataController *dataSource;

@property (strong, nonatomic) CLLocation *myLocation;
@property (nonatomic) NSUInteger distanceIndex;
@property (copy, nonatomic) NSString *searchDate;


@end
