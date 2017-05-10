//
//  ViewController.swift
//  Map Testing
//
//  Created by Martin Kelly on 10/05/2017.
//  Copyright © 2017 Martin Kelly. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mapView.delegate = self
    }

    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}

extension ViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        // Custom logic here
        let marker = GMSMarker()
        marker.position = coordinate
        marker.title = "I added this with a long tap"
        marker.snippet = ""
        marker.map = mapView
    }
}

