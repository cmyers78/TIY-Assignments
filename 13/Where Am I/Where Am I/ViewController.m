//
//  ViewController.m
//  Where Am I
//
//  Created by Christopher Myers on 6/8/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//


// 1. Import Map Kit and Core Location Frameworks

@import MapKit;
@import CoreLocation;

#import "ViewController.h"

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

// 2. Outlet to mapView

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

//@property (strong, nonatomic) NSString * query;


// 3. Create an instance of CLLocation manager
@property (strong, nonatomic) CLLocationManager * locationManager;

@end

@implementation ViewController


// resignFirstResponder to hide keyboard


- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self startUpdatingLocation];
    
    //self.mapView.showsPointsOfInterest = TRUE;
    self.mapView.showsCompass = TRUE;
    
    
}

//- (void) searchMap {
//    
//    // Create and initialize a search request object.
//    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
//    request.naturalLanguageQuery = self.query;
//    request.region = self.mapView.region;
//    
//    // Create and initialize a search object.
//    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
//    
//    // Start the search and display the results as annotations on the map.
//    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error)
//    {
//        NSMutableArray *placemarks = [NSMutableArray array];
//        for (MKMapItem *item in response.mapItems) {
//            [placemarks addObject:item.placemark];
//        }
//        [self.mapView removeAnnotations:[self.mapView annotations]];
//        [self.mapView showAnnotations:placemarks animated:NO];
//    }];
//
//    
//}


- (void) startUpdatingLocation {
    // 4. Initialize the location manager
    self.locationManager = [[CLLocationManager alloc ]init];
    
    // 5. IMPORTANT set the delegate to the viewcontroller
    self.locationManager.delegate = self;
    
    // 6. set the desired accuracy of the location manager
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    // takes up a lot of battery!
    //[self.locationManager startUpdatingLocation];
    
    //[self.locationManager startMonitoringSignificantLocationChanges];
    [self.locationManager requestWhenInUseAuthorization];

    
}
#pragma marks - Delegate Methods

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    NSLog(@"Did up date");
    
    CLLocation * location = [locations firstObject];
    CLLocationCoordinate2D coord = location.coordinate;
    
    NSLog(@"latitude == %2.8f, longitude == %2.8f", coord.latitude, coord.longitude);
    
    //REGION CODE TO CENTER ON MAP
    [self centerMapWithCoordinate:coord];
    
    
}
//-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
//    
//}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSLog(@"Authorization Changed");
    if (status != kCLAuthorizationStatusDenied) {
        [self.locationManager requestLocation];
    }
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Did Fail");
    
}

#pragma mark = Helper Methods

-(void) centerMapWithCoordinate: (CLLocationCoordinate2D) center {
    MKCoordinateRegion region = MKCoordinateRegionMake(center, MKCoordinateSpanMake(0.6, 0.6));
    
    [self.mapView setRegion:region animated:YES];
    [self.mapView setShowsUserLocation:YES];

}

- (IBAction)locationRequest:(UIBarButtonItem *)sender {
    
    [self.locationManager requestLocation];
    
}
- (IBAction)mapTogglePressed:(UIBarButtonItem *)sender {
    
    [self.mapView setMapType:MKMapTypeSatellite];
    
}
- (IBAction)initialMapToggle:(UIBarButtonItem *)sender {
    
    [self.mapView setMapType:MKMapTypeStandard];
    
}
- (IBAction)hybridMap:(UIBarButtonItem *)sender {
    [self.mapView setMapType:MKMapTypeHybrid];
    
}

@end
