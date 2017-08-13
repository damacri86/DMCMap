//
//  DMCMapView.m
//  DMCMapview
//
//  Created by David on 11/8/17.
//  Copyright © 2017 damacri.pods. All rights reserved.
//

@import MapKit;

#import "DMCMapView.h"

@interface DMCMapView () <MKMapViewDelegate>

@property (nonatomic, strong) NSArray<CLLocation *> *annotationsCoordinate;
@property (nonatomic, assign) CLLocationCoordinate2D centerCoordinate;
@property (nonatomic, assign) BOOL isScrollable;
@property (nonatomic, strong) MKMapView *nativeMapView;

@end

@implementation DMCMapView

#pragma mark - Lifecycle

- (nullable instancetype)initWithCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate isScrollable:(BOOL)isScrollable {
    
    self = [super init];
    
    if (self) {
        
        _centerCoordinate = centerCoordinate;
        _isScrollable = isScrollable;
        _annotationsCoordinate = [[NSArray alloc] init];
        [self customizeView];
    }
    
    return self;
}


#pragma mark - Public

- (void)addAnnotation:(nonnull DMCMapAnnotation *)annotation {

    NSMutableArray *annotationCoordinateMutable = [self.annotationsCoordinate mutableCopy];
    CLLocation *locationAnnotation = [[CLLocation alloc] initWithLatitude:annotation.coordinate.latitude longitude:annotation.coordinate.longitude];
    [annotationCoordinateMutable addObject:locationAnnotation];
    self.annotationsCoordinate = [annotationCoordinateMutable copy];
    
    [self.nativeMapView addAnnotation:annotation];
}

- (void)selectAnnotation:(nonnull DMCMapAnnotation *)annotation {
    
    [self.nativeMapView selectAnnotation:annotation animated:YES];
}

- (void)drawPath {
    
    [self drawRoute];
}


#pragma mark - Private

- (void)customizeView {
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.nativeMapView = [[MKMapView alloc] init];
    self.nativeMapView.delegate = self;
    self.nativeMapView.translatesAutoresizingMaskIntoConstraints = false;
    [self.nativeMapView setMapType:MKMapTypeStandard];
    self.nativeMapView.scrollEnabled = self.isScrollable;
    self.nativeMapView.showsUserLocation = YES;
    [self.nativeMapView setRegion:MKCoordinateRegionMakeWithDistance(self.centerCoordinate, 1500, 1500)];
    [self addSubview:self.nativeMapView];
    
    [self.nativeMapView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = true;
    [self.nativeMapView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = true;
    [self.nativeMapView.topAnchor constraintEqualToAnchor:self.topAnchor].active = true;
    [self.nativeMapView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = true;
}

- (void)drawRoute {
    
    [self.annotationsCoordinate enumerateObjectsUsingBlock:^(CLLocation *location, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx != self.annotationsCoordinate.count - 1) {
            
            CLLocationCoordinate2D localizationBegin = location.coordinate;
            MKPlacemark *placemarkBegin = [[MKPlacemark alloc] initWithCoordinate:localizationBegin];
            
            CLLocationCoordinate2D localizationEnd = self.annotationsCoordinate[idx +1].coordinate;
            MKPlacemark *placemarkEnd = [[MKPlacemark alloc] initWithCoordinate:localizationEnd];
            
            MKDirectionsRequest *directionRequest = [[MKDirectionsRequest alloc] init];
            directionRequest.source = [[MKMapItem alloc] initWithPlacemark:placemarkBegin];
            directionRequest.destination =[[MKMapItem alloc] initWithPlacemark:placemarkEnd];
            directionRequest.transportType = MKDirectionsTransportTypeWalking;
            
            MKDirections *directions = [[MKDirections alloc] initWithRequest:directionRequest];
            [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
                
                if (!error) {
                    
                    [self.nativeMapView addOverlay:response.routes.lastObject.polyline];
                }
            }];
        }
    }];
}


#pragma mark - MKMapView

- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered {
    
    [self.delegate mapViewDidFinishRenderingMap:self fullyRendered:fullyRendered];
}


- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if (annotation != mapView.userLocation) {
        
        DMCMapAnnotation *mapAnnotation = (DMCMapAnnotation *)annotation;
        MKPinAnnotationView *pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:mapAnnotation
                                                                                 reuseIdentifier:@"MKPinAnnotationView"];
        
        pinAnnotationView.canShowCallout = YES;
        UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinAnnotationView.rightCalloutAccessoryView = detailButton;
        return pinAnnotationView;
        
    } else {
        
        return nil;
    }
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    CLLocationCoordinate2D center = view.annotation.coordinate;
    center.latitude -= self.nativeMapView.region.span.latitudeDelta * 0.20;
    [self.nativeMapView setCenterCoordinate:center animated:YES];
    [self.delegate mapView:self didAnnotationSelected:view.annotation];
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    
    [self.delegate mapView:self didDeselectAnnotationView:view.annotation];
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    [self.delegate mapView:self didAnnotationCalloutPressed:view.annotation];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    
    MKPolylineRenderer  *routeLineRenderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    routeLineRenderer.strokeColor = [UIColor redColor];
    routeLineRenderer.lineWidth = 5;
    return routeLineRenderer;
}

@end
