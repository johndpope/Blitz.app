//
//  GDefaultClusterRenderer.h
//  Parkingmobility
//
//  Created by Colin Edwards on 1/18/14.
//  Copyright (c) 2014 Colin Edwards. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapbox/Mapbox.h>
#import "GClusterRenderer.h"

@interface GDefaultClusterRenderer : NSObject <GClusterRenderer> 

- (id)initWithMapView:(MGLMapView*)googleMap;

@end
