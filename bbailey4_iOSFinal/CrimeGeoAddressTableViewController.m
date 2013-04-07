//
//  CrimeGeoAddressTableViewController.m
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 4/6/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import "CrimeGeoAddressTableViewController.h"
#import "CrimeListTableViewController.h"

@interface CrimeGeoAddressTableViewController ()

@end

@implementation CrimeGeoAddressTableViewController

@synthesize addressArray = _addressArray;
@synthesize geoAddressString = _geoAddressString;
@synthesize distanceIndex = _distanceIndex;
@synthesize searchDate = _searchDate;

- (NSMutableArray *)addressArray
{
    if (_addressArray == nil) {
        _addressArray = [[NSMutableArray alloc] init];
    }
    return _addressArray;
}

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
    [self geoCodeAddress:[self.geoAddressString stringByAppendingString:@", Chicago, Illinois"]];
}

- (void)geoCodeAddress:(NSString *)addressString
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:addressString completionHandler:^(NSArray *placemarks, NSError *error){
        //process geocoding
        for (CLPlacemark *aPlacemark in placemarks) {
            [self.addressArray addObject:aPlacemark];
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.addressArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GeoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    CLPlacemark *aPlacemark = (CLPlacemark *)[self.addressArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [aPlacemark.addressDictionary valueForKey:@"Street"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowGeoCrimeListSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        [[segue destinationViewController] setDistanceIndex:self.distanceIndex];
        [[segue destinationViewController] setSearchDate:self.searchDate];
        //CLLocation *myLocation = [[CLLocation alloc] initWithLatitude:41.83128 longitude:-87.62697];
        CLLocation *myLocation = [[CLLocation alloc] initWithLatitude:[(CLPlacemark *)[self.addressArray objectAtIndex:indexPath.row] location].coordinate.latitude
                                                            longitude:[(CLPlacemark *)[self.addressArray objectAtIndex:indexPath.row] location].coordinate.longitude];
        [[segue destinationViewController] setMyLocation:myLocation];
    }
}

@end
