#import "BespokeClusterRenderer.h"
#import "GCluster.h"


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
    for (NSObject <MGLAnnotation> *annotation in _markerCache) {
        NSLog(@"annoation");
    }
    
    [_markerCache removeAllObjects];
    
    for (id <GCluster> cluster in clusters) {
        NSLog(@"cluster");
//        NSObject <MGLAnnotation> *marke = [[PetersMapMarker alloc] init];
//        [_markerCache addObject:marker];
        
        NSUInteger count = cluster.items.count;

//        marker.title = cluster.marker.title;
//        marker.userData = cluster.marker.userData;
//        marker.position = cluster.marker.position;
//        marker.map = _map;
    }
}
@end
