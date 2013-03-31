//
//  CrimeRecordDataController.m
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/29/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import "CrimeRecordDataController.h"
#import "CrimeRecord.h"

@interface CrimeRecordDataController ()

@end

@implementation CrimeRecordDataController

@synthesize crimeRecordList = _crimeRecordList;

- (id) init {
    self = [super init];
    if (self) {
        //[NSThread sleepForTimeInterval:2.0]; //For simulating network delay
    }
    return self;
}

- (NSMutableArray *) crimeRecordList
{
    if (_crimeRecordList == nil) {
        _crimeRecordList = [[NSMutableArray alloc] init];
    }
    return _crimeRecordList;
}

- (BOOL) loadJSONCrimeData
{
    NSString *serviceURL = @"https://data.cityofchicago.org/resource/x2n5-8w5q.json";
    NSString *queryString = @"?$where=within_box(location,+42.00,+-88.00,+41.90,+-87.90)+AND+date_of_occurrence%3E='2013-03-10T00:00:00'&$order=date_of_occurrence+DESC";
    
    //Create Request
    NSError *error = nil;
    NSURLResponse *response = nil;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSURL *URL = [NSURL URLWithString:[serviceURL stringByAppendingString:queryString]];
    [request setHTTPMethod:@"GET"];
    [request setURL:URL];
    [request setTimeoutInterval:30];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"Error performing request %@", [URL parameterString]);
        return NO;
    }
    
    //Create JSON String from Data
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"json: %@", jsonString);
    
    //Parse JSON
    NSError *jsonError = nil;
    NSArray *resultsJSONObject = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&jsonError];
    if (jsonError) {
        NSLog(@"JSON Details Error");
        return NO;
    }
    for (NSDictionary *obj in resultsJSONObject) {
        //NSLog([obj objectForKey:@"latitude"]);
        NSString *primaryDesc = [obj objectForKey:@"_primary_decsription"];
        NSString *secondaryDesc = [obj objectForKey:@"_secondary_description"];
        NSString *block = [obj objectForKey:@"block"];
        NSString *dateOf = [obj objectForKey:@"date_of_occurrence"];
        NSString *caseNum = [obj objectForKey:@"case_"];
        NSString *ward = [obj objectForKey:@"ward"];
        NSString *beat = [obj objectForKey:@"beat"];
        NSString *arrest = [obj objectForKey:@"arrest"];
        NSString *domestic = [obj objectForKey:@"domestic"];
        NSString *iucr = [obj objectForKey:@"_iucr"];
        NSString *fbi = [obj objectForKey:@"fbi_cd"];
        NSString *latitude = [obj objectForKey:@"latitude"];
        NSString *longitude = [obj objectForKey:@"longitude"];
        NSString *locationDesc = [obj objectForKey:@"_location_description"];
        
        CrimeRecord *aCrimeRecord = [[CrimeRecord alloc]
                                     initWithPrimaryDescription:primaryDesc
                                     andWithSecondaryDescription:secondaryDesc
                                     andWithBlock:block
                                     andWithCaseNumber:caseNum
                                     andWithDateOf:dateOf
                                     andWithWard:ward
                                     andWithBeat:beat
                                     andWithDomestic:([domestic isEqualToString:@"N"]) ? @"NO" : @"YES"
                                     andWithArrest:([arrest isEqualToString:@"N"]) ? @"NO" : @"YES"
                                     andWithIucr:iucr
                                     andWithFbiCd:fbi
                                     andWithLatitude:latitude
                                     andWithLongitude:longitude
                                     andWithLocationDescription:locationDesc];
        
        [self.crimeRecordList addObject:aCrimeRecord];
    }
    
    return YES;
}

- (NSUInteger) countOfCrimeRecordList
{
    return [self.crimeRecordList count];
}

- (CrimeRecord *) objectInCrimeRecordListAtIndex:(NSUInteger)index
{
    return [self.crimeRecordList objectAtIndex:index];
}

@end
