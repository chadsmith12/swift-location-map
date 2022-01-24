//
//  LocationsListView.swift
//  LocationMap
//
//  Created by Chad Smith on 1/23/22.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var locations: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(locations.locations) { location in
                Button(action: {
                    locations.selectLocation(location: location)
                }) {
                    HStack {
                        if let imageName = location.imageNames.first!  {
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .cornerRadius(10)
                        }
                        VStack(alignment: .leading) {
                            Text(location.name)
                                .font(.headline)
                            Text(location.cityName)
                                .font(.subheadline)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
                }

            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}
