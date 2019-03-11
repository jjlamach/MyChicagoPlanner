//
//  DetailViewController.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/5/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var locationDescription: UITextView!
    
    var chicagoLocation: Chicago!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
        
    override func viewWillAppear(_ animated: Bool) {
        if let chicago_location = self.chicagoLocation {
            self.locationName.text = chicago_location.location.name
            self.locationImage.image = chicago_location.location.image
            self.locationDescription.text += (chicago_location.location.description?.text)!
        }
    }
    
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        // dismisses the current view controller (DetailViewCtrl).
        dismiss(animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // sends the user to the TableView.
    }
    
    
    
    /**
      Adds the current selected location to the datasource.
    */
    @IBAction func addToPlanner(_ sender: UIButton) {
        let wasAdded = ChicagoDataSource.instance.addLocation(self.chicagoLocation)
        if !wasAdded {
            if let locationName = self.chicagoLocation.location.name {
                self.alertUserWithMessage("\(locationName) is already in your planner!")
                return
            }
        }
        else if wasAdded {
            self.alertUserWithMessage("\(self.chicagoLocation.location.name!) was added to your planner.")
        }
    }
    
    
    /**
        Alerts the user with a message.
    */
    private func alertUserWithMessage(_ message: String) {
        let alertCtrl = UIAlertController(title: "Chicago Planner", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertCtrl.addAction(action)
        present(alertCtrl, animated: true, completion: nil)
    }
}
