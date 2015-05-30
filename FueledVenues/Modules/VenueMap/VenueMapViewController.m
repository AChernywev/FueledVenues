//
//  VenueMapViewController.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 30/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "VenueMapViewController.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "Venue.h"
#import "Constants.h"
#import "Macroses.h"

@interface VenueMapViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic, weak) IBOutlet UINavigationItem *customItem;
@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation VenueMapViewController

#pragma mark - lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.customItem.title = LOC(@"venueslistcontroller.title");
    [self.mapView setRegion: MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(kFueledOfficeLatitude, kFueledOfficeLongitude), 1000, 1000) animated:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self requestUserPermission];
}

#pragma mark - properties
- (void)setVenues:(NSArray *)venues
{
    [self.view setNeedsDisplay];
    _venues = venues;
    [self.mapView removeAnnotations:self.mapView.annotations];
    for(Venue *venue in self.venues) {
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
        annotation.coordinate = CLLocationCoordinate2DMake(venue.latitude, venue.longitude);
        annotation.title = venue.name;
        [self.mapView addAnnotation:annotation];
    }
}

#pragma mark - working methods
- (void)requestUserPermission
{
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0") && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        [self.locationManager requestWhenInUseAuthorization];
    }
    else {
        self.mapView.showsUserLocation = YES;
    }
}

#pragma mark - Memory managment
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.mapView.mapType = !self.mapView.mapType;
    self.mapView.mapType = !self.mapView.mapType;
}

#pragma mark - <MKMapViewDelegate> methods
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    static NSString * const reuseIdentifier = @"reuseIdentifier";
    MKPinAnnotationView *view = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
    if(!view) {
        view = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    }
    view.canShowCallout = YES;
    view.image = [UIImage imageNamed:@"default_pin"];
    view.calloutOffset = CGPointMake(0, -2);
    
    view.annotation = annotation;
    return view;
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status != kCLAuthorizationStatusDenied && status != kCLAuthorizationStatusRestricted) {
        self.mapView.showsUserLocation = YES;
    }
}
@end
