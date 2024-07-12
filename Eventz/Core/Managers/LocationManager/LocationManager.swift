//
//  LocationManager.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 22/10/23.
//

import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    static let shared: LocationManager = .init()
    
    var locationManager: CLLocationManager
    
    @Published public private(set) var locationDescription: (cityLocation: String, streetLocation: String, districtLocation: String) = ("", "", "")
    @Published public private(set) var currentRegion: CLLocationCoordinate2D?
    
    private override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0] as CLLocation
        let geocoder = CLGeocoder()
        
        if currentRegion == nil {
            currentRegion = userLocation.coordinate
        }
        
        geocoder.reverseGeocodeLocation(userLocation) { [weak self] (placemarks, error) in
            if let placemarks, placemarks.count > 0 {
                let placemark = placemarks[0]
                if let city = placemark.locality {
                    self?.locationDescription.cityLocation = city
                }
                
                if let street = placemark.thoroughfare {
                    self?.locationDescription.districtLocation = street
                }
                
                if let district = placemark.subLocality {
                    self?.locationDescription.streetLocation = district
                }
            }
        }
    }
    
}
