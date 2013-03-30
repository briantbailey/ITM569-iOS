//
//  CrimeRecordDataController.h
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/29/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CrimeRecord;
@interface CrimeRecordDataController : NSObject

@property (copy, nonatomic) NSMutableArray *crimeRecordList;

- (NSUInteger) countOfCrimeRecordList;
- (CrimeRecord *) objectInCrimeRecordListAtIndex:(NSUInteger)index;

@end
