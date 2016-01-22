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

class LocationControllerView: UIViewController, CLLocationManagerDelegate{
    
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
        
        print( finalEl )
    }
    
}