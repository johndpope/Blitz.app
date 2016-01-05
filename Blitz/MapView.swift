//
//  MapView.swift
//  Blitz
//
//  Created by Umut Bozkurt on 05/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit
import Mapbox

class MapView: MGLMapView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        attributionButton.hidden = true
        
        setCenterCoordinate(CLLocationCoordinate2D(latitude: 40.7326808,
            longitude: -73.9843407),
            zoomLevel: 12, animated: false)
        // TODO: set current coordinate
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
