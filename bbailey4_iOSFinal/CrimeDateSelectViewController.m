//
//  CrimeDateSelectViewController.m
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 4/6/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import "CrimeDateSelectViewController.h"

@interface CrimeDateSelectViewController ()

@end

@implementation CrimeDateSelectViewController

@synthesize dateArray = _dateArray;
@synthesize selectedRow = _selectedRow;

@synthesize datePicker = _datePicker;
@synthesize delegate = _delegate;
@synthesize setDateButton = _setDateButton;

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
    [self.datePicker selectRow:self.selectedRow inComponent:0 animated:NO];
    UIImage *resizableButton = [[UIImage imageNamed:@"orangeButton.png" ] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *resizableButtonHighlighted = [[UIImage imageNamed:@"orangeButtonHighlight.png" ] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    [self.setDateButton setBackgroundImage:resizableButton forState:UIControlStateNormal];
    [self.setDateButton setBackgroundImage:resizableButtonHighlighted
                            forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didSelectDistance:(UIBarButtonItem *)sender {
    [self.delegate crimeDateSelectViewController:self didSelectDateIndex:self.selectedRow];
}

- (IBAction)didCancel:(UIBarButtonItem *)sender {
    [self.delegate crimeDateSelectViewController:self didCancel:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.dateArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.dateArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectedRow = row;
}

@end
