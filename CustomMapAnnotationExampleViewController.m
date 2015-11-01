#import "CustomMapAnnotationExampleViewController.h"
#import "BasicMapAnnotation.h"
#import "CalloutMapAnnotation.h"
#import "CalloutMapAnnotationView.h"
#import "AccessorizedCalloutMapAnnotationView.h"
#import "BasicMapAnnotationView.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface CustomMapAnnotationExampleViewController()

@property (nonatomic, retain) CalloutMapAnnotation *calloutAnnotation;
@property (nonatomic, retain) BasicMapAnnotation *customAnnotation;
@property (nonatomic, retain) BasicMapAnnotation *normalAnnotation;
@end


@implementation CustomMapAnnotationExampleViewController

@synthesize calloutAnnotation = _calloutAnnotation;
@synthesize mapView = _mapView;
@synthesize selectedAnnotationView = _selectedAnnotationView;
@synthesize customAnnotation = _customAnnotation;
@synthesize normalAnnotation = _normalAnnotation;


- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
	if (view.annotation == self.customAnnotation) {
		if (self.calloutAnnotation == nil) {
			self.calloutAnnotation = [[CalloutMapAnnotation alloc] initWithLatitude:view.annotation.coordinate.latitude
																	   andLongitude:view.annotation.coordinate.longitude];
		} else {
			self.calloutAnnotation.latitude = view.annotation.coordinate.latitude;
			self.calloutAnnotation.longitude = view.annotation.coordinate.longitude;
		}
		[self.mapView addAnnotation:self.calloutAnnotation];
		self.selectedAnnotationView = view;
	}
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
	if (self.calloutAnnotation && 
		view.annotation == self.customAnnotation && 
		!((BasicMapAnnotationView *)view).preventSelectionChange) {
		[self.mapView removeAnnotation: self.calloutAnnotation];
	}
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	if (annotation == self.calloutAnnotation) {
		CalloutMapAnnotationView *calloutMapAnnotationView = (CalloutMapAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CalloutAnnotation"];
		if (!calloutMapAnnotationView) {
			calloutMapAnnotationView = [[AccessorizedCalloutMapAnnotationView alloc] initWithAnnotation:annotation
																			 reuseIdentifier:@"CalloutAnnotation"] ;
			calloutMapAnnotationView.contentHeight = 130.0f;
        
			UIImage *asynchronyLogo = [UIImage imageNamed:@"120.png"];
			UIImageView *asynchronyLogoView = [[UIImageView alloc] initWithImage:asynchronyLogo] ;
			asynchronyLogoView.frame = CGRectMake(5, 4, asynchronyLogoView.frame.size.width, asynchronyLogoView.frame.size.height);
            asynchronyLogoView.layer.cornerRadius=10.0f;
            asynchronyLogoView.clipsToBounds=YES;
			[calloutMapAnnotationView.contentView addSubview:asynchronyLogoView];
            

		}
		calloutMapAnnotationView.parentAnnotationView = self.selectedAnnotationView;
		calloutMapAnnotationView.mapView = self.mapView;
		return calloutMapAnnotationView;
	} else if (annotation == self.customAnnotation) {
		MKPinAnnotationView *annotationView = [[BasicMapAnnotationView alloc] initWithAnnotation:annotation
																			   reuseIdentifier:@"CustomAnnotation"] ;
		annotationView.canShowCallout = NO;
		annotationView.pinColor = MKPinAnnotationColorGreen;
		return annotationView;
	} else if (annotation == self.normalAnnotation) {
		MKPinAnnotationView *annotationView = [[BasicMapAnnotationView alloc] initWithAnnotation:annotation
																			   reuseIdentifier:@"NormalAnnotation"] ;
		annotationView.canShowCallout = YES;
		annotationView.pinColor = MKPinAnnotationColorPurple;
		return annotationView;
	} else {
		MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
																			   reuseIdentifier:@"BehindCalloutAnnotation"] ;
		annotationView.canShowCallout = YES;
		annotationView.pinColor = MKPinAnnotationColorRed;
		return annotationView;
		
	}

	
	
	return nil;
}

- (void)mapView:(MKMapView *)mapView 
 annotationView:(MKAnnotationView *)view 
calloutAccessoryControlTapped:(UIControl *)control {
	
    //Accion boton
    
    Class itemClass = [MKMapItem class];
    if (itemClass && [itemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)]) {
        // iOS 6 MKMapItem available
        NSString *locationQuery = [NSString stringWithFormat:@"http://maps.apple.com/maps?saddr=40.679285,-3.616944&daddr=%f,%f", currentLocation.coordinate.latitude, currentLocation.coordinate.longitude];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:locationQuery]];
        
}
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    

	self.mapView.delegate = self;
	
	self.customAnnotation = [[BasicMapAnnotation alloc] initWithLatitude:40.679285 andLongitude:-3.616944] ;        //Coordenadas
	[self.mapView addAnnotation:self.customAnnotation];
	
	
	
	
	
	CLLocationCoordinate2D coordinate = {40.679285, -3.616944};
	[self.mapView setRegion:MKCoordinateRegionMake(coordinate, 
												   MKCoordinateSpanMake(0.02f, 0.02f))];
    [self.mapView setMapType:MKMapTypeHybrid];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    currentLocation = newLocation;
    [locationManager stopUpdatingLocation]; //Added to prevent continuous updating as we only needed the location once.
}


- (void)viewDidUnload {
	self.mapView = nil;
	self.customAnnotation = nil;
	self.normalAnnotation = nil;
}



@end
