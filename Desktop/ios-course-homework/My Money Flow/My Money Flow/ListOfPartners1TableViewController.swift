//
//  ListOfPartners1TableViewController.swift
//  My Money Flow
//
//  Created by Marta Romaniv on 03.12.16.
//  Copyright © 2016 Ostap Romaniv. All rights reserved.
//

import UIKit

class ListOfPartners1TableViewController: UITableViewController {
    // MARK: Properties
    var partners = [ThePartnerInfo]()
    
    func loadSamplePartners() {
        let photo1 = UIImage(named: "Image")!
        let photo2 = UIImage(named: "Image-1")!
        let photo3 = UIImage(named: "Image-2")!
        let partner1 = ThePartnerInfo(photo: photo1, name: "Ostap", surname: "Romaniv", mobileNumber: "0931526915", email: "romanivost@gmail.com", currentBalance: -1200.20)
        let partner2 = ThePartnerInfo(photo: photo2, name: "Olena", surname: "Magerovska", mobileNumber: "0931301947", email: "maher@gmail.com", currentBalance: -2500.20)
        let partner3 = ThePartnerInfo(photo: photo3, name: "Marta", surname: "Romaniv", mobileNumber: "0931526916", email: "romanivmarta@gmail.com", currentBalance: -3600.55)
        
        partners += [partner1, partner2, partner3]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let savedPartners = loadPartners() {
            partners += savedPartners
        } else {
            // Load the sample data.
            loadSamplePartners()
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return partners.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ThePartnerTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ThePartnerTableViewCell

        let partner = partners[indexPath.row]
        
//        if let partnerPh = partner.photo, let partnerN = partner.name, let partnerS = partner.surname, let balance = partner.currentBalance {
//            
//           
//        
//        cell.PartnerImage?.image = partnerPh
//        cell.PartnerNameSurname?.text = partnerN + " " + partnerS
//        cell.PartnerBalance?.text = String(describing: balance)
//            
//            //return cell
//        }
        
        if let pI = partner.photo, let pN = partner.name, let pS = partner.surname, let pB = partner.currentBalance {
        
        cell.PartnerImage?.image = pI
        cell.PartnerNameSurname?.text = pN + " " + pS
        cell.PartnerBalance?.text = String(describing: pB)
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            partners.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            savePartners()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowDetail" {
            let partnerDetailViewController = segue.destination as! PartnerInfoTableViewController
            
            // Get the cell that generated this segue.
            if let selectedPartnerCell = sender as? ThePartnerTableViewCell {
                
                let indexPath = tableView.indexPath(for: selectedPartnerCell)!
                let selectedPartner = partners[indexPath.row]
                partnerDetailViewController.partner = selectedPartner
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new partner.")
        }
    }
 
    
    @IBAction func unwindToPartnerList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? PartnerInfoTableViewController, let partner = sourceViewController.partner {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                partners[selectedIndexPath.row] = partner
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
            // Add a new Partner.
            let newIndexPath = NSIndexPath(row: partners.count, section: 0)
            partners.append(partner)
            tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
            }
            savePartners()
        }
    }
    
    // MARK: NSCoding
    func savePartners() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(partners, toFile: ThePartnerInfo.ArchieveURL!.path)
        if !isSuccessfulSave {
            print("Failed to save list of partners...")
        }
    }
    
    func loadPartners() -> [ThePartnerInfo]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: ThePartnerInfo.ArchieveURL!.path) as? [ThePartnerInfo]
    }
    
}
