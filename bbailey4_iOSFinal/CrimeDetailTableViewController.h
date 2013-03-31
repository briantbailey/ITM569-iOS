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

@property (weak, nonatomic) IBOutlet UILabel *primaryDesc;

@end
