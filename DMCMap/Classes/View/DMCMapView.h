//
//  DMCMapView.h
//  DMCMapview
//
//  Created by David on 11/8/17.
//  Copyright © 2017 damacri.pods. All rights reserved.
//

@import UIKit;

#import "DMCMapAnnotation.h"

@class DMCMapView;

@protocol DMCMapViewDelegate <NSObject>

@optional

- (void)mapViewDidFinishRenderingMap:(nonnull DMCMapView *)mapView fullyRendered:(BOOL)fullyRendered;
- (void)mapView:(nonnull DMCMapView *)mapView didAnnotationSelected:(nonnull DMCMapAnnotation *)annotation;
- (void)mapView:(nonnull DMCMapView *)mapView didDeselectAnnotationView:(nonnull DMCMapAnnotation *)annotation;
- (void)mapView:(nonnull DMCMapView *)mapView didAnnotationCalloutPressed:(nonnull DMCMapAnnotation *)annotaton;

@end

@interface DMCMapView : UIView

@property (nonatomic, weak, nullable) id<DMCMapViewDelegate> delegate;

- (nullable instancetype)initWithCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate isScrollable:(BOOL)isScrollable;

- (void)addAnnotation:(nonnull DMCMapAnnotation *)annotation;
- (void)selectAnnotation:(nonnull DMCMapAnnotation *)annotation;
- (void)drawPath;

@end
