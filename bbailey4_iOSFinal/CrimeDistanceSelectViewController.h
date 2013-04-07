//
//  CrimeDistanceSelectViewController.h
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 4/6/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrimeDistanceSelectViewController;

@protocol CrimeDistanceSelectViewControllerDelegate <NSObject>

- (void)crimeDistanceViewController:(CrimeDistanceSelectViewController *)sender
             didSelectDistanceIndex:(NSUInteger)index;

- (void)crimeDistanceViewController:(CrimeDistanceSelectViewController *)sender
                          didCancel:(BOOL)cancel;

@end

@interface CrimeDistanceSelectViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) NSArray *distanceArray;
@property (nonatomic) NSUInteger selectedRow;

@property (weak, nonatomic) IBOutlet UIPickerView *distancePicker;

@property (weak, nonatomic) id <CrimeDistanceSelectViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *setSearchButton;

@end
