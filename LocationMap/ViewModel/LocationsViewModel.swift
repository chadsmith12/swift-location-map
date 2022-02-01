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
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationsList = false
    @Published var selectedLocation: Location? = nil
    
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
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("could not find current index in locations array. Something is wrong!")
            return
        }
        
        // check to make sure currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else {
                return
            }
            selectLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        selectLocation(location: nextLocation)
    }
    
    var currentName: String {
        "\(mapLocation.name), \(mapLocation.cityName)"
    }
}
