//
//  NavyPier.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/5/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import Foundation
import UIKit

class NavyPier: Chicago {
    override init() {
        super.init()
    }
    override init(_ locationName: String, _ image: UIImage) {
        super.init(locationName, image)
        self.initializeNPDescription()
    }
    private func initializeNPDescription() {
        self.location.description?.text += "Navy Pier is a 3,300-foot-long (1,010 m) pier on the Chicago shoreline of Lake Michigan. It is located in the Streeterville neighborhood of the Near North Side community area. The Navy Pier currently encompasses more than fifty acres of parks, gardens, shops, restaurants, family attractions and exhibition facilities and is the top leisure destination in the Midwestern United States (Midwest), drawing nearly nine million visitors annually. It is one of the most visited attractions in the entire Midwest and is Chicago's number one tourist attraction"
    }
}
