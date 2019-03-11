//
//  RestaurantDetailViewController.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/11/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    @IBOutlet weak var restaurantName: UILabel!
    var name:String = ""
    
    @IBOutlet weak var restaurantAddress: UILabel!
    var address:String = ""
    
    @IBOutlet weak var phone: UILabel!
    var phoneNum: String = ""
    
    @IBOutlet weak var restaurantRating: UILabel!
    var rating: Double = 0.0
    
    @IBOutlet weak var restaurantImage: UIImageView!
    var image:UIImage = UIImage()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.restaurantName.text = name
        self.restaurantAddress.text = address
        self.phone.text = phoneNum
        self.restaurantRating.text = String(rating)
        self.restaurantImage.image = image
    }
}
