//
//  CrimeRecord.m
//  bbailey4_iOSFinal
//
//  Created by Brian Bailey on 3/29/13.
//  Copyright (c) 2013 Brian Bailey. All rights reserved.
//

#import "CrimeRecord.h"

@interface CrimeRecord()

@end

@implementation CrimeRecord

@synthesize caseNum = _caseNum;
@synthesize dateOf = _dateOf;
@synthesize block = _block;
@synthesize iucr = _iucr;
@synthesize primaryDesc = _primaryDesc;
@synthesize secondaryDesc = _secondaryDesc;
@synthesize locationDesc = _locationDesc;
@synthesize arrest = _arrest;
@synthesize domestic = _domestic;
@synthesize beat = _beat;
@synthesize ward = _ward;
@synthesize fbi_cd = _fbi_cd;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize distanceToMyLocation = _distanceToMyLocation;

- (id) init
{
    return [self initWithPrimaryDescription:nil
                andWithSecondaryDescription:nil
                               andWithBlock:nil
                          andWithCaseNumber:nil
                              andWithDateOf:nil
                                andWithWard:nil
                                andWithBeat:nil
                            andWithDomestic:nil
                              andWithArrest:nil
                                andWithIucr:nil
                               andWithFbiCd:nil
                            andWithLatitude:nil
                           andWithLongitude:nil
                 andWithLocationDescription:nil];
}

- (id) initWithPrimaryDescription:(NSString *)primaryDescription
      andWithSecondaryDescription:(NSString *)secondaryDescription
                     andWithBlock:(NSString *)block
                andWithCaseNumber:(NSString *)caseNum
                    andWithDateOf:(NSString *)dateOf
                      andWithWard:(NSString *)ward
                      andWithBeat:(NSString *)beat
                  andWithDomestic:(NSString *)domestic
                    andWithArrest:(NSString *)arrest
                      andWithIucr:(NSString *)iucr
                     andWithFbiCd:(NSString *)fbiCd
                  andWithLatitude:(NSString *)latitude
                 andWithLongitude:(NSString *)longitude
       andWithLocationDescription:(NSString *)locationDescription
{
    self = [super init];
    if (self) {
        // init subclass
        self.primaryDesc = primaryDescription;
        self.secondaryDesc = secondaryDescription;
        self.block = block;
        self.caseNum = caseNum;
        self.dateOf = dateOf;
        self.ward = ward;
        self.beat = beat;
        self.domestic = domestic;
        self.arrest = arrest;
        self.iucr = iucr;
        self.fbi_cd = fbiCd;
        self.latitude = latitude;
        self.longitude = longitude;
        self.locationDesc = locationDescription;
    }
    return self;
}

@end
