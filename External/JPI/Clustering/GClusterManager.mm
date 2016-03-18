#import "GClusterManager.h"
#import "GCluster.h"


@implementation GClusterManager {
 //   GMSCameraPosition *previousCameraPosition;
}

- (void)setMapView:(MGLMapView*)mapView {
   // previousCameraPosition = nil;
    _mapView = mapView;
}

- (void)setClusterAlgorithm:(id <GClusterAlgorithm>)clusterAlgorithm {
    //previousCameraPosition = nil;
    _clusterAlgorithm = clusterAlgorithm;
}

- (void)setClusterRenderer:(id <GClusterRenderer>)clusterRenderer {
   /// previousCameraPosition = nil;
    _clusterRenderer = clusterRenderer;
}

- (void)addItem:(id <GClusterItem>) item {
    [_clusterAlgorithm addItem:item];
}

- (void)removeItems {
  [_clusterAlgorithm removeItems];
}

- (void)removeItemsNotInRectangle:(CGRect)rect {
    NSLog(@"TODO - removeItemsNotInRectangle %f",rect.size.width);
  //  [_clusterAlgorithm removeItemsNotInRectangle:rect];
}

- (void)cluster {
    NSSet *clusters = [_clusterAlgorithm getClusters:_mapView.zoomLevel];
    [_clusterRenderer clustersChanged:clusters];
}

#pragma mark mapview delegate
/*
-(void)mapView:(MGLMapView *)mapView willMove:(BOOL)gesture {
    if ([self delegate] != nil
        && [self.delegate respondsToSelector:@selector(mapView:willMove:)]) {
    //    [self.delegate mapView:mapView willMove:gesture];
    }
}


*/
- (void)mapView:(MGLMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    
}

/**
 Tells the delegate that the region displayed by the map view is changing.
 
 This method is called whenever the currently displayed map region changes. During movement, this method may be called many times to report updates to the map position. Therefore, your implementation of this method should be as lightweight as possible to avoid affecting performance.
 
 @param mapView The map view whose visible region is changing.
 */
- (void)mapViewRegionIsChanging:(MGLMapView *)mapView{
    
}

/**
 Tells the delegate that the region displayed by the map view just changed.
 
 This method is called whenever the currently displayed map region has finished changing.
 
 @param mapView The map view whose visible region changed.
 @param animated Whether the change caused an animated effect on the map.
 */
- (void)mapView:(MGLMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    [self cluster];
}
/*
- (void)mapView:(MGLMapView *)mapView idleAtCameraPosition:(GMSCameraPosition *)cameraPosition {
    assert(mapView == _mapView);
    
    // Don't re-compute clusters if the map has just been panned/tilted/rotated.
    GMSCameraPosition *position = [mapView camera];
    if (previousCameraPosition != nil && previousCameraPosition.zoom == position.zoom) {
        if ([self delegate] != nil
            && [self.delegate respondsToSelector:@selector(mapView:idleAtCameraPosition:)]) {
            [self.delegate mapView:mapView idleAtCameraPosition:cameraPosition];
        }
        return;
    }
    previousCameraPosition = [mapView camera];
    
    [self cluster];
    
    if ([self delegate] != nil
        && [self.delegate respondsToSelector:@selector(mapView:idleAtCameraPosition:)]) {
        [self.delegate mapView:mapView idleAtCameraPosition:cameraPosition];
    }
}

-(void)mapView:(MGLMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    if ([self delegate] != nil
        && [self.delegate respondsToSelector:@selector(mapView:didTapAtCoordinate:)]) {
        [self.delegate mapView:mapView didTapAtCoordinate:coordinate];
    }
}

-(void)mapView:(MGLMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate {
    if ([self delegate] != nil
        && [self.delegate respondsToSelector:@selector(mapView:didLongPressAtCoordinate:)]) {
        [self.delegate mapView:mapView didLongPressAtCoordinate:coordinate];
    }
}

- (BOOL)mapView:(MGLMapView *)mapView didTapMarker:(GMSMarker *)marker {
    if ([self delegate] != nil
        && [self.delegate respondsToSelector:@selector(mapView:didTapMarker:)]) {
        return [self.delegate mapView:mapView didTapMarker:marker];
    }
    
    return true;
}

- (void)mapView:(MGLMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
    if ([self delegate] != nil
        && [self.delegate respondsToSelector:@selector(mapView:didTapInfoWindowOfMarker:)]) {
        [self.delegate mapView:mapView didTapInfoWindowOfMarker:marker];
    }
}

- (void)mapView:(MGLMapView *)mapView didTapOverlay:(GMSOverlay *)overlay {
    if ([self delegate] != nil
        && [self.delegate respondsToSelector:@selector(mapView:didTapOverlay:)]) {
        [self.delegate mapView:mapView didTapOverlay:overlay];
    }
}

- (UIView *)mapView:(MGLMapView *)mapView markerInfoWindow:(GMSMarker *)marker {
    if ([self delegate] != nil
        && [self.delegate respondsToSelector:@selector(mapView:markerInfoWindow:)]) {
        return [self.delegate mapView:mapView markerInfoWindow:marker];
    }
    
    return nil;
}

- (UIView *)mapView:(MGLMapView *)mapView markerInfoContents:(GMSMarker *)marker {
    if ([self delegate] != nil
        && [self.delegate respondsToSelector:@selector(mapView:markerInfoContents:)]) {
        return [self.delegate mapView:mapView markerInfoContents:marker];
    }
    
    return nil;
}

*/
#pragma mark convenience

+ (instancetype)managerWithMapView:(MGLMapView*)googleMap
                         algorithm:(id<GClusterAlgorithm>)algorithm
                          renderer:(id<GClusterRenderer>)renderer {
    GClusterManager *mgr = [[[self class] alloc] init];
    if(mgr) {
        googleMap.delegate = mgr;
        mgr.mapView = googleMap;
        mgr.clusterAlgorithm = algorithm;
        mgr.clusterRenderer = renderer;
    }
    return mgr;
}

@end
