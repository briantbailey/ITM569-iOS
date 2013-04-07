//
//  CrimeLaunchTableViewController.h
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/31/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CrimeLaunchTableViewController : UITableViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UITableViewCell *addressCell;

@property (weak, nonatomic) IBOutlet UITextField *textInputField;
@end
