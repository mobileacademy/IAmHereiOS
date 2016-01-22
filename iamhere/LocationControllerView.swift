//
//  LocationControllerView.swift
//  iamhere
//
//  Created by Mac on 22/01/16.
//  Copyright © 2016 Mobile Academy. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class LocationControllerView: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    var locationManager:CLLocationManager?
    
    override func viewDidLoad(){
        
        locationManager = CLLocationManager();
        locationManager?.delegate = self
        
        switch (CLLocationManager.authorizationStatus()){
        case .AuthorizedAlways:
                break;
        case .AuthorizedWhenInUse:
            requestLocation()
            break;
        case .Denied:
            break;
        case .NotDetermined:
                self.requestAuth()
            break;
        case .Restricted:
            break;
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        locationManager?.stopUpdatingLocation()
    }
    
    func requestAuth(){
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func requestLocation(){
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
       requestLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let finalEl = locations[locations.count-1]
        
        longLabel.text = String(finalEl.coordinate.longitude)
        latLabel.text = String(finalEl.coordinate.latitude)
        
        map.setRegion( MKCoordinateRegion(center:finalEl.coordinate, span:MKCoordinateSpan(latitudeDelta:0.01, longitudeDelta:0.01) ), animated: true)
    }
    
}