#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <Mapbox/Mapbox.h>

@protocol GCluster <NSObject>

@property(nonatomic, assign, readonly) CLLocationCoordinate2D position;

@property(nonatomic, strong, readonly) NSSet *items;

@property(nonatomic, strong)  NSObject <MGLAnnotation> *marker;

@end
