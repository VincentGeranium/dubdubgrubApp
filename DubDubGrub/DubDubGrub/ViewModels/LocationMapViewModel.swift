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
            latitude: 37.5642135,
            longitude: 127.0016985
        ), span: MKCoordinateSpan(
            latitudeDelta: 0.01,
            longitudeDelta: 0.01
        )
    )
    
    @Published var locations: [DDGLocation] = []
}

extension LocationMapViewModel {
    func getLocations() {
        CloudKitManager.getLocations { [weak self] result in
            switch result {
            case .success(let locations):
                self?.locations = locations
            case .failure(_):
                self?.alertItem = AlertContext.unableToGetLocation
            }
        }
    }
}
