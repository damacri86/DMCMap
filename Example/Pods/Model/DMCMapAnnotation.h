//
//  DMCMapAnnotation.h
//  DMCMapview
//
//  Created by David on 11/8/17.
//  Copyright © 2017 damacri.pods. All rights reserved.
//

@import MapKit;

#import <Foundation/Foundation.h>

@interface DMCMapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, assign) NSInteger categoryId;
@property (nonatomic, readonly, copy, nullable) NSString *title;
@property (nonatomic, readonly, copy, nullable) NSString *subtitle;
@property (nonatomic, readonly, copy, nullable) NSString *imageName;

- (nullable instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                                  withTitle:(nullable NSString *)title
                               withSubtitle:(nullable NSString *)subtitle
                              withImageName:(nullable NSString *)imageName
                                 categoryId:(NSInteger)categoryId;

@end
