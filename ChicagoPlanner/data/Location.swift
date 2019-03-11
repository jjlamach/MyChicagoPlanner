//
//  Location.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/5/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import Foundation
import UIKit

struct Location {
    var name: String?
    var image: UIImage?
    var description: UITextView?
}

class Chicago {
    var location: Location
    
    init() {
        self.location = Location()
    }

    init(_ locationName: String, _ image: UIImage) {
        self.location = Location()
        self.location.name = locationName
        self.location.image = image
        self.location.description = UITextView()
    }
    var currentLocation: Location {
        get {
            return self.location
        }
        set(location) {
            self.location = location
        }
    }
}
