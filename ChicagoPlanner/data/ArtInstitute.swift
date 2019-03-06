//
//  ArtInstitute.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/5/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import Foundation
import UIKit

class ArtInstitute: Chicago {
    override init() {
        super.init()
    }
    
    override init(_ locationName: String, _ image: UIImage) {
        super.init(locationName, image)
        self.initializeArtInstituteDescription()
    }
    
    private func initializeArtInstituteDescription() {
        self.location.description?.text += "The Art Institute of Chicago, founded in 1879 and located in Chicago's Grant Park, is one of the oldest and largest art museums in the United States. Recognized for its curatorial efforts and popularity among visitors, the museum hosts approximately 1.5 million guests annually.Its collection, stewarded by 11 curatorial departments, is encyclopedic, and includes iconic works such as Georges Seurat's A Sunday on La Grande Jatte, Pablo Picasso's The Old Guitarist, Edward Hopper's Nighthawks, and Grant Wood's American Gothic. Its permanent collection of nearly 300,000 works of art is augmented by more than 30 special exhibitions mounted yearly that illuminate aspects of the collection and present cutting-edge curatorial and scientific research."
    }
}
