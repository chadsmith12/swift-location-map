//
//  LocationMapApp.swift
//  LocationMap
//
//  Created by Chad Smith on 1/13/22.
//

import SwiftUI

@main
struct LocationMapApp: App {
    @StateObject private var vm: LocationsViewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
