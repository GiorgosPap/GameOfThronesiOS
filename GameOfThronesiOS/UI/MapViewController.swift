//
//  MapViewController.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 26/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//

import UIKit
import Mapbox

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let url = URL(string: "mapbox://styles/mapbox/streets-v10")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), zoomLevel: 9, animated: false)
        view.addSubview(mapView)
         */
        
        let customStyleURL = Bundle.main.url(forResource: "third_party_vector_style", withExtension: "json")!
        
        let mapView = MGLMapView(frame: view.bounds, styleURL: customStyleURL)
        
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.tintColor = .white
        
        view.addSubview(mapView)
    }

}
