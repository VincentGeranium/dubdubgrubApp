//
//  LocationMapViewModel.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/28.
//

import Foundation
import MapKit


final class LocationMapViewModel: NSObject, ObservableObject {

    @Published var alertItem: AlertItem?
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.539925,
            longitude: 127.070625
        ), span: MKCoordinateSpan(
            latitudeDelta: 0.04,
            longitudeDelta: 0.04
        )
    )
    
    var deviceLocationManager: CLLocationManager?
}

extension LocationMapViewModel {
    func getLocations(for locationManager: LocationManager) {
        CloudKitManager.getLocations { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let locations):
                    locationManager.locations = locations
                case .failure(_):
                    self?.alertItem = AlertContext.unableToGetLocation
                }
            }
        }
    }
    
    func isLocationSevicesEnable() {
        if CLLocationManager.locationServicesEnabled() == true {
            deviceLocationManager = CLLocationManager()
            deviceLocationManager?.delegate = self
            
            // this is default desiredAccuracy
            deviceLocationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            // show an alert
            alertItem = AlertContext.locationDisabled
        }
    }
    
    // User permission
    private func checkLocationAuthorization() {
        guard let deviceLocationManager = deviceLocationManager else { return }
        
        switch deviceLocationManager.authorizationStatus {
        case .notDetermined:
            deviceLocationManager.requestWhenInUseAuthorization()
        case .restricted:
            // show alert
            alertItem = AlertContext.locationRestricted
        case .denied:
            // show alert
            alertItem = AlertContext.locationDenied
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
}

extension LocationMapViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
