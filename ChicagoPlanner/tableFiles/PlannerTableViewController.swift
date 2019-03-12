//
//  PlannerTableViewController.swift
//  ChicagoPlanner
//
//  Created by Julio on 3/5/19.
//  Copyright © 2019 Julio Lama. All rights reserved.
//

import UIKit

class PlannerTableViewController: UITableViewController {
    
    var locationNames: [Chicago] = []
    var locNames: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setUpNames()
        self.tableView.reloadData()        
    }
    
    
    
    private func setUpNames() -> Void {
        self.locationNames = ChicagoDataSource.instance.getDatSource()
        for name in self.locationNames {
            let currName = name.location.name!
            self.locNames.insert(currName, at: 0)
        }
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.locationNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowCell", for: indexPath) as! TableViewCell
        // Configure the cell...
        
        cell.locationName.text = self.locNames[indexPath.row]

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedCell = self.tableView.cellForRow(at: indexPath) as! TableViewCell
            ChicagoDataSource.instance.removeLocation(selectedCell.locationName.text!)
            self.locationNames.remove(at: indexPath.row)
            self.locNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.locationWasDeletedAlert(selectedCell.locationName.text!)
        }
    }
    
    private func locationWasDeletedAlert(_ locationName: String) -> Void {
        let message: String = "Location \(locationName) was deleted from your planner."
        let title: String = "Chicago Planner"
        let alertCtrl = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertCtrl.addAction(okayAction)
        present(alertCtrl, animated: true, completion: nil)
    }
    
 
 

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
