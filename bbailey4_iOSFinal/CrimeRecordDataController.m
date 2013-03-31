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
@synthesize degreesLatitudeDistanceArray = _degreesLatitudeDistanceArray;
@synthesize degreesLongitudeDistanceArray = _degreesLongitudeDistanceArray;
@synthesize distanceArrayInMeters = _distanceArrayInMeters;

- (id) init {
    self = [super init];
    if (self) {
        //[NSThread sleepForTimeInterval:2.0]; //For simulating network delay
    }
    return self;
}

- (NSArray *) degreesLatitudeDistanceArray
{
    if (_degreesLatitudeDistanceArray == nil) {
        _degreesLatitudeDistanceArray = [[NSArray alloc] initWithObjects:@0.000274, @0.000686, @0.001372, @0.002745, @0.003623, @0.007246, @0.014493, nil];
    }
    return _degreesLatitudeDistanceArray;
}

- (NSArray *) degreesLongitudeDistanceArray
{
    if (_degreesLongitudeDistanceArray == nil) {
        _degreesLongitudeDistanceArray = [[NSArray alloc] initWithObjects:@0.000451, @0.001127, @0.002255, @0.004509, @0.005952, @0.011905, @0.023810, nil];
    }
    return _degreesLongitudeDistanceArray;
}

- (NSArray *) distanceArrayInMeters
{
    if (_distanceArrayInMeters == nil) {
        _distanceArrayInMeters = [[NSArray alloc] initWithObjects:@30.48, @76.2, @152.4, @304.8, @402.336, @804.672, @1609.344, nil];
    }
    return _distanceArrayInMeters;
}

- (NSMutableArray *) crimeRecordList
{
    if (_crimeRecordList == nil) {
        _crimeRecordList = [[NSMutableArray alloc] init];
    }
    return _crimeRecordList;
}

- (BOOL) loadJSONCrimeDataNearLocation:(CLLocation *)location
                     withDistanceIndex:(NSUInteger)distanceIndex
          withStringFormatedSearchDate:(NSString *)stringSearchDate
{
    NSString *serviceURL = @"https://data.cityofchicago.org/resource/x2n5-8w5q.json";
    //NSString *queryString = @"?$where=within_box(location,+42.00,+-88.00,+41.90,+-87.90)+AND+date_of_occurrence%3E='2013-03-10T00:00:00'&$order=date_of_occurrence+DESC";
    
    //Dynamic Query
    NSString *queryParam = [NSString stringWithFormat:@"?$where=within_box(location,+%f,+%f,+%f,+%f)+AND+date_of_occurrence%%3E='%@T00:00:00'&$order=date_of_occurrence+DESC",
                            (location.coordinate.latitude + [[self.degreesLatitudeDistanceArray objectAtIndex:distanceIndex] doubleValue]),
                            (location.coordinate.longitude - [[self.degreesLongitudeDistanceArray objectAtIndex:distanceIndex] doubleValue]),
                            (location.coordinate.latitude - [[self.degreesLatitudeDistanceArray objectAtIndex:distanceIndex] doubleValue]),
                            (location.coordinate.longitude + [[self.degreesLongitudeDistanceArray objectAtIndex:distanceIndex] doubleValue]),
                            stringSearchDate];
    //NSLog(@"%@", queryParam);
    
    //Create Request
    NSError *error = nil;
    NSURLResponse *response = nil;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSURL *URL = [NSURL URLWithString:[serviceURL stringByAppendingString:queryParam]];
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
        
        double distTo = [location distanceFromLocation:[[CLLocation alloc] initWithLatitude:[aCrimeRecord.latitude doubleValue]
                                                                  longitude:[aCrimeRecord.longitude doubleValue]]];
        [aCrimeRecord setDistanceToMyLocation:distTo];
        
        if (aCrimeRecord.distanceToMyLocation <= [[self.distanceArrayInMeters objectAtIndex:distanceIndex] doubleValue]) {
            [self.crimeRecordList addObject:aCrimeRecord];
        }
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
