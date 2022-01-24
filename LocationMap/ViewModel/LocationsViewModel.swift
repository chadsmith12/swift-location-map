//
//  LocationsViewModel.swift
//  LocationMap
//
//  Created by Chad Smith on 1/23/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel : ObservableObject {
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion = MKCoordinateRegion()
    private let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationsList = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut)  {
            showLocationsList.toggle()
        }
    }
    
    func selectLocation(location: Location) {
        withAnimation(.easeInOut) {
            self.mapLocation = location
            self.showLocationsList = false
        }
    }
    
    var currentName: String {
        "\(mapLocation.name), \(mapLocation.cityName)"
    }
}
