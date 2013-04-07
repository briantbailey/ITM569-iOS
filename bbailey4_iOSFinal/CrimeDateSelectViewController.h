//
//  CrimeDateSelectViewController.h
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 4/6/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrimeDateSelectViewController;
@protocol CrimeDateSelectViewControllerDelegate <NSObject>

- (void)crimeDateSelectViewController:(CrimeDateSelectViewController *)sender
                   didSelectDateIndex:(NSUInteger)index;

@end

@interface CrimeDateSelectViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *datePicker;

@property (weak, nonatomic) NSArray *dateArray;
@property (nonatomic) NSUInteger selectedRow;

@property (weak, nonatomic) id <CrimeDateSelectViewControllerDelegate> delegate;
@end
