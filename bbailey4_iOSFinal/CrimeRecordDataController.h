//
//  CrimeRecordDataController.h
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/29/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class CrimeRecord;
@interface CrimeRecordDataController : NSObject

@property (copy, nonatomic) NSMutableArray *crimeRecordList;

@property (readonly, nonatomic) NSArray *degreesLatitudeDistanceArray;
@property (readonly, nonatomic) NSArray *degreesLongitudeDistanceArray;
@property (readonly, nonatomic) NSArray *distanceArrayInMeters;

- (NSUInteger) countOfCrimeRecordList;
- (CrimeRecord *) objectInCrimeRecordListAtIndex:(NSUInteger)index;

- (BOOL) loadJSONCrimeDataNearLocation:(CLLocation *)location
                     withDistanceIndex:(NSUInteger)distanceIndex
          withStringFormatedSearchDate:(NSString *)stringSearchDate;

@end
