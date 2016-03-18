#import <Foundation/Foundation.h>
#import "GClusterRenderer.h"
#import <Mapbox/Mapbox.h>

@interface BespokeClusterRenderer : NSObject <GClusterRenderer>

- (id)initWithMapView:(MGLMapView *)googleMap;
@property (nonatomic) int mode;
@end


