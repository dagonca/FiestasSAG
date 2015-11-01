#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CalloutMapAnnotation.h"
#import "BasicMapAnnotation.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface CustomMapAnnotationExampleViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
	
    CLLocation *currentLocation;
    CLLocationManager *locationManager;
    
    
    MKMapView *_mapView;
	CalloutMapAnnotation *_calloutAnnotation;
	MKAnnotationView *_selectedAnnotationView;
	BasicMapAnnotation *_customAnnotation;
	BasicMapAnnotation *_normalAnnotation;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) MKAnnotationView *selectedAnnotationView;

@end

