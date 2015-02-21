//
//  CustomAnnotation.h
//  TIMES
//
//  Created by Sami Shamsan on 1/5/15.
//  Copyright (c) 2015 com.Sami.Times. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject <MKAnnotation>

@property (nonatomic, strong) NSString *place;
@property (nonatomic, strong) NSString *imageName;

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;

+ (MKAnnotationView *)createViewAnnotationForMapView:(MKMapView *)mapView annotation:(id <MKAnnotation>)annotation;

@end