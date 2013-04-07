//
//  CrimeDistanceSelectViewController.m
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 4/6/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import "CrimeDistanceSelectViewController.h"

@interface CrimeDistanceSelectViewController ()

@end

@implementation CrimeDistanceSelectViewController

@synthesize distancePicker = _distancePicker;
@synthesize delegate = _delegate;

@synthesize distanceArray = _distanceArray;
@synthesize selectedRow = _selectedRow;
@synthesize setSearchButton = _setSearchButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.distancePicker selectRow:self.selectedRow inComponent:0 animated:NO];
    UIImage *resizableButton = [[UIImage imageNamed:@"orangeButton.png" ] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *resizableButtonHighlighted = [[UIImage imageNamed:@"orangeButtonHighlight.png" ] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    [self.setSearchButton setBackgroundImage:resizableButton forState:UIControlStateNormal];
    [self.setSearchButton setBackgroundImage:resizableButtonHighlighted
                            forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didSelectDistance:(UIBarButtonItem *)sender {
    [self.delegate crimeDistanceViewController:self didSelectDistanceIndex:self.selectedRow];
}

- (IBAction)didCancel:(UIBarButtonItem *)sender {
    [self.delegate crimeDistanceViewController:self didCancel:YES];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.distanceArray.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.distanceArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectedRow = row;
}

@end
