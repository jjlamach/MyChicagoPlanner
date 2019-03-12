//
//  RestaurantsTableViewController.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/11/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import UIKit
import CDYelpFusionKit
import AlamofireImage
import Alamofire

class RestaurantsTableViewController: UITableViewController {
    
    let yelpApiClient = CDYelpAPIClient(apiKey: "xnC0Ft-qWRmrN4Ba5tpsZvCERCV3CgT60-Uw1-lQvR3e8QQHJ_DvRrQMRbgnpdXgOROxNOdCm7DxKrH5b0rvb54FDdCvlno7mLlHf27hFLPGwYyKCxRIh3LdxoeGXHYx")
    
    // Alamofire image downloader.
    let downloader = ImageDownloader()
    
    
    var restaurantNames:[String] = []
    var restaurantImages: [UIImage] = []
    var restaurantAddresses: [String] = []
    var restaurantPhones: [String] = []
    var restaurantRatings: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func retrieveImages() {
        self.yelpApiClient.searchBusinesses(byTerm: "Food", location: "Chicago", latitude: nil, longitude: nil, radius: nil, categories: nil, locale: CDYelpLocale.english_unitedStates, limit: 10, offset: nil, sortBy: CDYelpBusinessSortType.rating, priceTiers: nil, openNow: nil, openAt: nil, attributes: nil) {
            (response) in
            if let dataResponse = response?.businesses {
                for business in dataResponse {
                    // edit the image to fit on the cells. then add them to the array.
                    if let businessImageUrl = business.imageUrl {
                        Alamofire.request(businessImageUrl).responseImage {
                            response in
                            let sizeForEditedImage = CGSize(width: 100.0, height: 100.0)
                            var editedImage = response.result.value?.af_imageScaled(to: sizeForEditedImage)
                            editedImage = response.result.value?.af_imageAspectScaled(toFit: sizeForEditedImage)
                            editedImage = response.result.value?.af_imageAspectScaled(toFill: sizeForEditedImage)
                            if let image = editedImage {
                                self.restaurantImages.append(image)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func fetchChicagoRestaurants() {
        self.yelpApiClient.searchBusinesses(byTerm: "Food", location: "Chicago", latitude: nil, longitude: nil, radius: nil, categories: nil, locale: CDYelpLocale.english_unitedStates, limit: 10, offset: nil, sortBy: CDYelpBusinessSortType.rating, priceTiers: nil, openNow: nil, openAt: nil, attributes: nil) {
            (response) in
            if let dataResponse = response?.businesses {
                for business in dataResponse {
                    self.restaurantNames.append(business.name!)
                    self.restaurantAddresses.append((business.location?.addressOne!)!)
                    self.restaurantPhones.append(business.phone!)
                    self.restaurantRatings.append(business.rating!)
//                    if let businessName = business.name {
//                        self.restaurantNames.append(businessName)
//                    }
//                    if let location = business.location {
//                        if let address = location.addressOne {
//                            self.restaurantAddresses.append(address)
//                        }
//                    }
//                    if let phoneNumber = business.phone {
//                        self.restaurantPhones.append(phoneNumber)
//                    }
//                    if let restaurantRating = business.rating {
//                        self.restaurantRatings.append(restaurantRating)
//                    }
//
//                    if let businessAddress = business.location?.addressOne {
//                        self.restaurantAddresses.append(businessAddress)
//                    }
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! RestaurantCellView
        cell.restaurantName.text = self.restaurantNames[indexPath.row]
        cell.restaurantImage.image = self.restaurantImages[indexPath.row]
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailViewCtrl = segue.destination as? RestaurantDetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                detailViewCtrl.name = self.restaurantNames[indexPath.row]
                detailViewCtrl.address = self.restaurantAddresses[indexPath.row]
                detailViewCtrl.phoneNum = self.restaurantPhones[indexPath.row]
                detailViewCtrl.rating = self.restaurantRatings[indexPath.row]
                detailViewCtrl.image = self.restaurantImages[indexPath.row]
            }
        }
    }


}
