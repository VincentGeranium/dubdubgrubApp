//
//  LocationMapViewModel.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/28.
//

import Foundation
import MapKit


final class LocationMapViewModel: ObservableObject {

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
}
