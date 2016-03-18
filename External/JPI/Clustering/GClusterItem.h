#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <Mapbox/Mapbox.h>

//
@protocol GClusterItem <NSObject>

@property (nonatomic, assign, readonly) CLLocationCoordinate2D position;

@property (nonatomic, strong) NSObject <MGLAnnotation> *marker;

@end
