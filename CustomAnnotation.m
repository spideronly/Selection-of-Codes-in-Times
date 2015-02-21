//
//  CustomAnnotation.m
//  TIMES
//
//  Created by Sami Shamsan on 1/5/15.
//  Copyright (c) 2015 com.Sami.Times. All rights reserved.
//


#import "CustomAnnotation.h"
#import "CustomAnnotationView.h"    // MKAnnotationView for the Tea Garden

@implementation CustomAnnotation

+ (MKAnnotationView *)createViewAnnotationForMapView:(MKMapView *)mapView annotation:(id <MKAnnotation>)annotation
{
    MKAnnotationView *returnedAnnotationView =
    (CustomAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:NSStringFromClass([CustomAnnotation class])];
    if (returnedAnnotationView == nil)
    {
        returnedAnnotationView =
        [[CustomAnnotationView alloc] initWithAnnotation:annotation
                                         reuseIdentifier:NSStringFromClass([CustomAnnotation class])];
    }
    
    return returnedAnnotationView;
}

@end
