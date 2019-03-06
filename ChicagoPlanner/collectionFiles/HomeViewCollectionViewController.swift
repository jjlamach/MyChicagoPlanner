//
//  HomeViewCollectionViewController.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/5/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import UIKit

private let reuseIdentifier = "locationCell"

class HomeViewCollectionViewController: UICollectionViewController {
    
    var imageFiles: [UIImage] = []
    var imageNames: [(String, String)] = []
    var locationNames: [String] = []
    
    
    var chicagoLocation: Chicago?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initializeCellImages()
    }
    
    func initializeCellImages() -> Void {
        self.imageNames = [
            ("cloud-gate.jpg", "Cloud Gate"),
            ("mill-park.jpg", "Millenium Park"),
            ("navy-pier.png", "Navy Pier"),
            ("art-institute.jpg", "Art Institute")
        ]
        for name in self.imageNames.enumerated() {
            let currentImgName = UIImage(named: name.element.0)
            let currentLocationName = name.element.1
            self.imageFiles.append(currentImgName!)
            self.locationNames.append(currentLocationName)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.locationNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        cell.locationImage.image = self.imageFiles[indexPath.row]
        cell.locationName.text = self.locationNames[indexPath.row]
        
        // Configure the cell
    
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? DetailViewController {
            let currentCell = sender as! CollectionViewCell
            let indexPath = self.collectionView!.indexPath(for: currentCell)
            if indexPath?.row == 0 {
                let cloudGate = CloudGate(currentCell.locationName.text!, currentCell.locationImage.image!)
                self.chicagoLocation = Chicago()
                self.chicagoLocation = cloudGate
            }
            else if indexPath?.row == 1 {
                let millPark = MilleniumPark(currentCell.locationName.text!, currentCell.locationImage.image!)
                self.chicagoLocation = Chicago()
                self.chicagoLocation = millPark
            }
            else if indexPath?.row == 2 {
                let navyPier = NavyPier(currentCell.locationName.text!, currentCell.locationImage.image!)
                self.chicagoLocation = Chicago()
                self.chicagoLocation = navyPier
            }
            else if indexPath?.row == 3 {
                let artInstitute = ArtInstitute(currentCell.locationName.text!, currentCell.locationImage.image!)
                self.chicagoLocation = Chicago()
                self.chicagoLocation = artInstitute
            }
            target.chicagoLocation = self.chicagoLocation
        }
    }
}
