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
    
    func addLocation(_ location: Chicago) -> Bool {
        if search(location.location.name!) {
            return false
        }
        else {
            ChicagoDataSource.selectedLocations.append(location)
            return true
        }
    }
    
    func removeLocation(_ location: Chicago) -> Void {
        
    }
    
    private func search(_ locationName: String) -> Bool {
        for location in ChicagoDataSource.selectedLocations {
            let currentLocation = location.location.name!
            if currentLocation == locationName {
                return true
            }
        }
        return false
    }
    
    func dataSourceSize() -> Int {
        return ChicagoDataSource.selectedLocations.count
    }
    
    func getDatSource() -> [Chicago] {
        return ChicagoDataSource.selectedLocations
    }
    
    func printDatSource() -> Void {
        print(self.getDatSource())
    }
    
    func locationsAsString() -> [String] {
        var result:[String] = []
        for location in ChicagoDataSource.selectedLocations {
            let name = location.location.name!
            if !result.contains(name) {
                result.append(name)
            }
        }
        return result
    }
}
