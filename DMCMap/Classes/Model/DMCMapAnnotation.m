//
//  DMCMapAnnotation.m
//  DMCMapview
//
//  Created by David on 11/8/17.
//  Copyright © 2017 damacri.pods. All rights reserved.
//

#import "DMCMapAnnotation.h"

@interface DMCMapAnnotation ()

@property (nonatomic, readwrite, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, readwrite, copy, nullable) NSString *title;
@property (nonatomic, readwrite, copy, nullable) NSString *subtitle;
@property (nonatomic, readwrite, copy, nullable) NSString *imageName;

@end

@implementation DMCMapAnnotation

#pragma mark - Lifecycle

- (nullable instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                                  withTitle:(nullable NSString *)title
                               withSubtitle:(nullable NSString *)subtitle
                              withImageName:(nullable NSString *)imageName {
    
    self = [super init];
    
    if (self) {
        
        _coordinate = coordinate;
        _title = title;
        _subtitle = subtitle;
        _imageName = imageName;
    }
    
    return self;
}

@end
