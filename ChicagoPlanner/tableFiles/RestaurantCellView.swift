//
//  RestaurantCellView.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/11/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import UIKit

class RestaurantCellView: UITableViewCell {

    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
