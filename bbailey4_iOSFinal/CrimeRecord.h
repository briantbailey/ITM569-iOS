//
//  CrimeRecord.h
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/29/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrimeRecord : NSObject

@property (copy, nonatomic) NSString *caseNum;
@property (copy, nonatomic) NSString *dateOf;
@property (copy, nonatomic) NSString *block;
@property (copy, nonatomic) NSString *iucr;
@property (copy, nonatomic) NSString *primaryDesc;
@property (copy, nonatomic) NSString *secondaryDesc;
@property (copy, nonatomic) NSString *locationDesc;
@property (copy, nonatomic) NSString *arrest;
@property (copy, nonatomic) NSString *domestic;
@property (copy, nonatomic) NSString *beat;
@property (copy, nonatomic) NSString *ward;
@property (copy, nonatomic) NSString *fbi_cd;
@property (strong, nonatomic) NSNumber *latitude;
@property (strong, nonatomic) NSNumber *longitude;
@property (strong, nonatomic) NSNumber *distanceToMyLocation;

- (id) init;

//Designated Initializer
- (id) initWithPrimaryDescription:(NSString *)primaryDescription
      andWithSecondaryDescription:(NSString *)secondaryDescription;

@end
