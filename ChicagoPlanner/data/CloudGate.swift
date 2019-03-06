//
//  CloudGate.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/5/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import Foundation
import UIKit

class CloudGate: Chicago {
    
    override init() {
        super.init()
    }
    
    override init(_ locationName: String, _ image: UIImage) {
        super.init(locationName, image)
        self.initializeCloudGateDescription()
    }
    private func initializeCloudGateDescription() {
        self.location.description?.text += "Cloud Gate is a public sculpture by Indian-born British artist Sir Anish Kapoor,that is the centerpiece of AT&T Plaza at Millennium Park in the Loop community area of Chicago, Illinois. Kapoor's design was inspired by liquid mercury and the sculpture's surface reflects and distorts the city's skyline. Visitors are able to walk around and under Cloud Gate's 12-foot. The sculpture was the result of a design competition"
    }
    
}
