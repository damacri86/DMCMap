//
//  DMCViewController.m
//  DMCMap
//
//  Created by damacri86 on 08/12/2017.
//  Copyright (c) 2017 damacri86. All rights reserved.
//

#import "DMCViewController.h"
#import <DMCMap/DMCMapView.h">

@interface DMCViewController () <DMCMapViewDelegate>

@end

@implementation DMCViewController

#pragma mark - Lifecycle

- (void)loadView {
    
    self.view = [[DMCMapView alloc] initWithCenterCoordinate:CLLocationCoordinate2DMake(40.415011, -3.683855)
                                                isScrollable:YES];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
}

#pragma mark - DMCMapViewDelegate

- (void)mapViewDidFinishRenderingMap:(nonnull DMCMapView *)mapView fullyRendered:(BOOL)fullyRendered {

    NSLog(@"Map fully rendered");
}

- (void)mapView:(nonnull DMCMapView *)mapView didAnnotationSelected:(nonnull DMCMapAnnotation *)annotation {

    NSLog(@"Did annotation selected with title %@", annotation.title);
}

- (void)mapView:(nonnull DMCMapView *)mapView didDeselectAnnotationView:(nonnull DMCMapAnnotation *)annotation {

    NSLog(@"Did annotation diselected with title %@", annotation.title);
}

- (void)mapView:(nonnull DMCMapView *)mapView didAnnotationCalloutPressed:(nonnull DMCMapAnnotation *)annotaton {
    
    NSLog(@"Did annotation callout pressed with title %@", annotaton.title);
}


@end
