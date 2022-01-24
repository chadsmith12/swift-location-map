//
//  Location.swift
//  LocationMap
//
//  Created by Chad Smith on 1/19/22.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String  {
        name + cityName
    }
}

extension Location : Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
