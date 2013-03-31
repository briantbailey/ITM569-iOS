//
//  CrimeDetailTableViewController.h
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/29/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrimeRecord;
@interface CrimeDetailTableViewController : UITableViewController

@property (weak, nonatomic) CrimeRecord *aCrimeRecord;

@property (weak, nonatomic) IBOutlet UILabel *primaryDescLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondaryDescLabel;
@property (weak, nonatomic) IBOutlet UILabel *blockLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *caseLabel;
@property (weak, nonatomic) IBOutlet UILabel *wardLabel;
@property (weak, nonatomic) IBOutlet UILabel *beatLabel;
@property (weak, nonatomic) IBOutlet UILabel *domesticLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrestLabel;
@property (weak, nonatomic) IBOutlet UILabel *iucrLabel;
@property (weak, nonatomic) IBOutlet UILabel *fbiLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locDescLabel;

@end
