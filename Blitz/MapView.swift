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
       
        
        setCenterCoordinate(CLLocationCoordinate2D(latitude: 40.7326808,
            longitude: -73.9843407),
            zoomLevel: 12, animated: false)
        // TODO: set current coordinate
        
        // Declare the annotation `point` and set its coordinates, title, and subtitle
        let point = MGLPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: 40.7326808,
            longitude: -73.9843407)
        point.title = "Hello world!"
        point.subtitle = "Welcome to The Ellipse."
        
        // Add annotation `point` to the map
           self.delegate = self
        self.addAnnotation(point)
      self.showsUserLocation = true
        
        renderer = BespokeClusterRenderer(mapView: self)
        algo = NonHierarchicalDistanceBasedAlgorithm(maxDistanceAtZoom: 50)
        clusterManager = GClusterManager(mapView: self, algorithm: algo, renderer: renderer)
        // WARNING the cluster manager will hijack all mapview delegate calls
        
        
    }
    

    func mapView(mapView: MGLMapView, imageForAnnotation annotation: MGLAnnotation) -> MGLAnnotationImage? {
        var annotationImage = mapView.dequeueReusableAnnotationImageWithIdentifier("paper")
        if annotationImage == nil {
            
            let image = UIImage(named: "paper")
            annotationImage = MGLAnnotationImage(image: image!, reuseIdentifier: "paper")
            
        }
        
        return annotationImage
    }

    func mapView(mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Create a reference to a Firebase location
       // var myRootRef = Firebase(url:"https://metsterios.firebaseio.com/")
        // Write data to Firebase
       // myRootRef.setValue("Do you have data? You'll love Firebase.")
        return true
    }
    
//    func mapView(mapView: MGLMapView, layerForAnnotation annotation: MGLAnnotation) -> MGL {
//        if annotation.isUserLocationAnnotation {
//            return nil
//        }
//        let RMMarker:marker
//        marker = RMMarker(UIImage: UIImage(named: "astronaut.png"))
//        marker.canShowCallout = true
//        marker.bounds = CGRectMake(0, 0, 100, 143)
//        var animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "contents")
//        // Each keyframe value is used in turn, no interpolated values are calculated.
//        animation.calculationMode = kCAAnimationDiscrete
//        // animation will take 2 seconds
//        animation.duration = 2.0
//        //Setting this property to HUGE_VALF will cause the animation to repeat forever.
//        animation.repeatCount = HUGE_VALF
//        // Creating a mutable array for our png sequence
//        var frameValues: [AnyObject] = NSMutableArray()
//        for var i = 0; i < 40; i++ {
//            // if i is smaller than 10, our image name will need 4 times 0: astronaut_00000.png,
//        }
//    }
//    
    
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
