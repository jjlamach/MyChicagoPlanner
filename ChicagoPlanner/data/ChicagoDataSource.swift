//
//  ChicagoDataSource.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/5/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import Foundation

final class ChicagoDataSource {
    static let instance = ChicagoDataSource()
    
    static var selectedLocations: [Chicago] = []
    
    private init() {}
    
    /**
     Add a Chicago location to the data source array.
    */
    func addLocation(_ location: Chicago) -> Bool {
        if search(location.location.name!) {
            return false
        }
        else {
            ChicagoDataSource.selectedLocations.append(location)
            return true
        }
    }
    /**
     Removes a location from the data source array.
    */
    func removeLocation(_ locationName: String) -> Void {
        for (index, currLocation) in ChicagoDataSource.selectedLocations.enumerated() {
            if currLocation.location.name == locationName {
                ChicagoDataSource.selectedLocations.remove(at: index)
                return
            }
        }
    }
    /**
     Searches for a location from the data source array.
    */
    private func search(_ locationName: String) -> Bool {
        for location in ChicagoDataSource.selectedLocations {
            let currentLocation = location.location.name!
            if currentLocation == locationName {
                return true
            }
        }
        return false
    }
    
    /**
     Returns the size of the data source array.
    */
    func dataSourceSize() -> Int {
        return ChicagoDataSource.selectedLocations.count
    }
    
    /**
     Returns the data source array.
    */
    func getDatSource() -> [Chicago] {
        return ChicagoDataSource.selectedLocations
    }
    
    /**
    */
    func printDatSource() -> Void {
        print(self.getDatSource())
    }
}
