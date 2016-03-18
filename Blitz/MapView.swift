//
//  MapView.swift
//  Blitz
//
//  Created by Umut Bozkurt on 05/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit
import Mapbox

class MapView: MGLMapView,MGLMapViewDelegate
{
    
    var  renderer :BespokeClusterRenderer?
    var algo:NonHierarchicalDistanceBasedAlgorithm?
    var clusterManager:GClusterManager?
    

    
    override init(frame: CGRect)
    {
        
        super.init(frame: frame,styleURL:MGLStyle.darkStyleURL())
   
        
        autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        attributionButton.hidden = true
        logoView.alpha = 0.6
       
        
        setCenterCoordinate(CLLocationCoordinate2D(latitude: 40.78494009999999, longitude: -73.9514683),
            zoomLevel: 12, animated: false)
        // TODO: set current coordinate
      self.showsUserLocation = true
        
        renderer = BespokeClusterRenderer(mapView: self)
        algo = NonHierarchicalDistanceBasedAlgorithm(maxDistanceAtZoom: 50)
        clusterManager = GClusterManager(mapView: self, algorithm: algo, renderer: renderer)
        // WARNING the cluster manager will hijack all mapview delegate calls

        for _ in 0...12 {
           let spot =   renderer!.generateSpot()
            clusterManager!.addItem(spot)
        }
        
        clusterManager!.cluster()
     clusterManager?.delegate = self
        
        
    }
    

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
