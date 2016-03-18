#import <Foundation/Foundation.h>
#import "GClusterRenderer.h"
#import <Mapbox/Mapbox.h>
#import "GClusterItem.h"

@interface Spot : NSObject <GClusterItem>

@property (nonatomic) CLLocationCoordinate2D location;
@property (nonatomic, strong) NSObject <MGLAnnotation> *marker;

@end
@interface BespokeClusterRenderer : NSObject <GClusterRenderer>

- (id)initWithMapView:(MGLMapView *)googleMap;
- (Spot*)generateSpot;

@property (nonatomic) int mode;
@end


