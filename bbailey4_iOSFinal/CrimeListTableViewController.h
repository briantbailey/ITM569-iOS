//
//  CrimeListTableViewController.h
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/29/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrimeRecordDataController;
@interface CrimeListTableViewController : UITableViewController

@property (strong, nonatomic) CrimeRecordDataController *dataSource;

@end
