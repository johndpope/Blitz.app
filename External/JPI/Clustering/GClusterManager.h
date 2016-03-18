#import <Foundation/Foundation.h>
#import "GClusterRenderer.h"
#import "GQTPointQuadTreeItem.h"
#import <Mapbox/Mapbox.h>
#import "GClusterAlgorithm.h"


@interface GClusterManager : NSObject <MGLMapViewDelegate> 

@property(nonatomic, strong) MGLMapView *mapView;
@property(nonatomic, weak) id<MGLMapViewDelegate> delegate;
@property(nonatomic, strong) id<GClusterAlgorithm> clusterAlgorithm;
@property(nonatomic, strong) id<GClusterRenderer> clusterRenderer;
@property(nonatomic, strong) NSMutableArray *items;

- (void)addItem:(id <GClusterItem>) item;
- (void)removeItems;
- (void)removeItemsNotInRectangle:(CGRect)rect;
- (void)hideItemsNotInVisibleBounds;

- (void)removeItem:(id <GClusterItem>) item;
- (BOOL)containsItem:(id <GClusterItem>) item;
- (void)cluster;

//convenience

+ (instancetype)managerWithMapView:(GMSMapView*)googleMap
                         algorithm:(id<GClusterAlgorithm>)algorithm
                          renderer:(id<GClusterRenderer>)renderer;

@end
