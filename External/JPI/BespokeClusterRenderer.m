#import "BespokeClusterRenderer.h"
#import "GCluster.h"




@implementation Spot

- (CLLocationCoordinate2D)position {
    return self.location;
}

@end


@implementation BespokeClusterRenderer {
    MGLMapView *_map;
    NSMutableArray *_markerCache;
}

- (id)initWithMapView:(MGLMapView *)googleMap {
    if (self = [super init]) {
        _map = googleMap;
        _markerCache = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)clustersChanged:(NSSet *)clusters {
//    for (NSObject <MGLAnnotation> *annotation in _markerCache) {
//        NSLog(@"annoation");
//    }
//    
    
    [_map removeAnnotations:_markerCache];
    [_markerCache removeAllObjects];
    
    for (id <GCluster> cluster in clusters) {
       [_markerCache addObject:cluster.marker];
        
        NSUInteger count = cluster.items.count;
        [_map addAnnotation:cluster.marker];
          NSLog(@"cluster count :%lu",(unsigned long)count );
//        marker.title = cluster.marker.title;
//        marker.userData = cluster.marker.userData;
//        marker.position = cluster.marker.position;
//        marker.map = _map;
        
    }
}
- (Spot*)generateSpot {
    
    MGLPointAnnotation *marker = [[MGLPointAnnotation alloc] init];
    marker.title = [NSString stringWithFormat:@"Test %f", [self getRandomNumberBetween:1 maxNumber:100]];
    //latitude: 40.7326808, longitude: -73.9843407
    marker.coordinate = CLLocationCoordinate2DMake(
                                                 [self getRandomNumberBetween:40.78494009999999 maxNumber:40.7723432],
                                                 [self getRandomNumberBetween:-73.9514683 maxNumber:-73.9148271]);
    
    Spot* spot = [[Spot alloc] init];
    spot.location = marker.coordinate;
    spot.marker = marker;
    return spot;
}

- (double)getRandomNumberBetween:(double)min maxNumber:(double)max
{
    return min + (max - min)*drand48();
}


@end
