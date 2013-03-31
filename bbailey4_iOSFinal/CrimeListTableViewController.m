//
//  CrimeListTableViewController.m
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/29/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import "CrimeListTableViewController.h"
#import "CrimeRecordDataController.h"
#import "CrimeRecord.h"

@interface CrimeListTableViewController ()

@end

@implementation CrimeListTableViewController

@synthesize dataSource = _dataSource;

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
    
    dispatch_queue_t loadQueue = dispatch_queue_create("edu.iit.bbailey4.bbailey4_iOSFinal.loadData.progress", NULL);
    dispatch_async(loadQueue, ^{
        self.dataSource = [[CrimeRecordDataController alloc] init];
        [self.dataSource loadJSONCrimeData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });//end main queue dispatch
    });//end loadQueue block dispatch
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource countOfCrimeRecordList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Crime List Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    CrimeRecord *crimeRecordAtIndex = [self.dataSource objectInCrimeRecordListAtIndex:indexPath.row];
    cell.textLabel.text = crimeRecordAtIndex.primaryDesc;
    cell.detailTextLabel.text = crimeRecordAtIndex.secondaryDesc;
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}





@end
