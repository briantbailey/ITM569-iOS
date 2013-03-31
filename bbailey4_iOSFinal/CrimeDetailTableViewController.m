//
//  CrimeDetailTableViewController.m
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/29/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import "CrimeDetailTableViewController.h"
#import "CrimeRecord.h"

@interface CrimeDetailTableViewController ()

- (void)configureView;

@end

@implementation CrimeDetailTableViewController

@synthesize aCrimeRecord = _aCrimeRecord;
@synthesize primaryDescLabel = _primaryDesc;
@synthesize secondaryDescLabel = _secondaryDesc;
@synthesize blockLabel = _blockLabel;
@synthesize caseLabel = _caseLabel;
@synthesize dateLabel = _dateLabel;
@synthesize wardLabel = _wardLabel;
@synthesize beatLabel = _beatLabel;
@synthesize domesticLabel = _domesticLabel;
@synthesize arrestLabel = _arrestLabel;
@synthesize fbiLabel = _fbiLabel;
@synthesize iucrLabel = _iucrLabel;
@synthesize latitudeLabel = _latitudeLabel;
@synthesize longitudeLabel = _longitudeLabel;
@synthesize locDescLabel = _locDescLabel;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
    [self.tableView setAllowsSelection:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView
{
    if (self.aCrimeRecord) {
        self.primaryDescLabel.text = self.aCrimeRecord.primaryDesc;
        self.secondaryDescLabel.text = self.aCrimeRecord.secondaryDesc;
        self.blockLabel.text = self.aCrimeRecord.block;
        self.caseLabel.text = self.aCrimeRecord.caseNum;
        self.dateLabel.text = self.aCrimeRecord.dateOf;
        self.wardLabel.text = self.aCrimeRecord.ward;
        self.beatLabel.text = self.aCrimeRecord.beat;
        self.arrestLabel.text = self.aCrimeRecord.arrest;
        self.domesticLabel.text = self.aCrimeRecord.domestic;
        self.iucrLabel.text = self.aCrimeRecord.iucr;
        self.fbiLabel.text = self.aCrimeRecord.fbi_cd;
        self.latitudeLabel.text = self.aCrimeRecord.latitude;
        self.longitudeLabel.text = self.aCrimeRecord.longitude;
        self.locDescLabel.text = self.aCrimeRecord.locationDesc;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 13) {
        return 72.0f;
    }
    return 44.0f;
}



//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}
//
//
//#pragma mark - Table view delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    /*
//     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
//     */
//}


@end
