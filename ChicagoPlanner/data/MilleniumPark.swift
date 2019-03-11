//
//  MilleniumPark.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/5/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import Foundation
import UIKit


class MilleniumPark: Chicago {
    override init() {
        super.init()
    }
    
    override init(_ locationName: String, _ image: UIImage) {
        super.init(locationName, image)
        self.initializeLocationDescription()
    }
    
    private func initializeLocationDescription() {
        if let description = self.location.description {
            description.text += "Millennium Park is a public park located in the Loop community area of Chicago in Illinois operated by the Chicago Department of Cultural Affairs and managed by MB Real Estate.The park was originally intended to celebrate the third millennium and is a prominent civic center near the city's Lake Michigan shoreline that covers a 24.5-acre (99,000 m2) section of northwestern Grant Park. The area was previously occupied by parkland, Illinois Central rail yards, and parking lots.[1] The park, which is bounded by Michigan Avenue, Randolph Street, Columbus Drive and East Monroe Drive, features a variety of public art. As of 2009, Millennium Park trailed only Navy Pier as a Chicago tourist attraction and by 2017 it had become the number one tourist attraction in the Midwestern United States. In 2015, the park became the location of the city's annual Christmas tree lighting."
        }
    }
}
