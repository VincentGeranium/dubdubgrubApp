//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/23.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    @EnvironmentObject private var locationManager: LocationManager
    
    @StateObject private var viewModel = LocationMapViewModel()
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $viewModel.region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: locationManager.locations) { location in
                MapMarker(coordinate: location.location.coordinate, tint: .brandPrimary)
            }
            .accentColor(.brandSecondary)
            .ignoresSafeArea()
            
            VStack {
                LogoView(frameWidth: 125)
                    .shadow(radius: 10)
                
                Spacer()
            }
        }
        .sheet(isPresented: $viewModel.isShowingOnBoardingView, onDismiss: viewModel.isLocationSevicesEnable) {
            OnboardView(isShowingOnBoardView: $viewModel.isShowingOnBoardingView)
        }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .onAppear {
            viewModel.runStartupChecks()
            
            if locationManager.locations.isEmpty {
                viewModel.getLocations(for: locationManager)
            }
        }
    }
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}
