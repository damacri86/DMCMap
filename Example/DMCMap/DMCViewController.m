//
//  DMCViewController.m
//  DMCMap
//
//  Created by damacri86 on 08/12/2017.
//  Copyright (c) 2017 damacri86. All rights reserved.
//

@import DMCMap;

#import "DMCViewController.h"

@interface DMCViewController () <DMCMapViewDelegate>

@property (nonatomic, strong) DMCMapView *mapView;

@end

@implementation DMCViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.mapView = [[DMCMapView alloc] initWithCenterCoordinate:CLLocationCoordinate2DMake(40.415011, -3.683855)
                                                   isScrollable:YES];
    self.mapView.translatesAutoresizingMaskIntoConstraints = false;
    self.mapView.delegate = self;

    [self.view addSubview:self.mapView];
    [self.mapView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = true;
    [self.mapView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = true;
    [self.mapView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = true;
    [self.mapView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = true;

    DMCMapAnnotation *annotation = [[DMCMapAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(40.415011, -3.683855)
                                                                      withTitle:@"Annotation title"
                                                                   withSubtitle:@"Annotation subtitle"
                                                                  withImageName:nil];
    
    [self.mapView addAnnotation:annotation];
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
