//
//  CrimeViewController.h
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/26/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrimeViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) NSArray *pickerData;

@end
