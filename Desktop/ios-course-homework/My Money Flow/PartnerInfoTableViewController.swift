//
//  PartnerInfoTableViewController.swift
//  My Money Flow
//
//  Created by Marta Romaniv on 03.12.16.
//  Copyright © 2016 Ostap Romaniv. All rights reserved.
//

import UIKit

class PartnerInfoTableViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var PartnerImage: UIImageView?
    @IBOutlet weak var PartnerNameSurname: UITextField!
    @IBOutlet weak var PartnerMobileNumber: UITextField?
    @IBOutlet weak var PartnerEmail: UITextField?
    @IBOutlet weak var PartnerBalance: UILabel?
    
    @IBOutlet weak var saveButton: UIBarButtonItem?

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else {
            navigationController!.popViewController(animated: true)
        }
    }
    
//    @IBAction func cancel(_ sender: UIBarButtonItem) {
//       
//        let isPresentingInAddMealMode = presentingViewController is UINavigationController
//        
//        if isPresentingInAddMealMode {
//            dismiss(animated: true, completion: nil)
//        }
//        else {
//            navigationController!.popViewController(animated: true)
//        }
//    }
    
    var partner: ThePartnerInfo?
    var note: TheReportNote?
    var arrayOfPartersNotes : [TheReportNote] = []
    
    func balance( array: inout [TheReportNote]) -> Decimal {
        var sum: Decimal = 0
        
        for i in array {
            if let summ = i.sum {
                
                sum += summ
            }
        }
        return sum
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        PartnerNameSurname?.delegate = self
//        PartnerMobileNumber?.delegate = self
//        PartnerEmail?.delegate = self
        
        let  cb = balance(array: &arrayOfPartersNotes)
        
        
        if let partner = partner, let pN = partner.name, let pS = partner.surname, let pI = partner.photo, let pMN = partner.mobileNumber, let pE = partner.email {
            
            //let partnerBalance = partnerNote?.note?.sum
            
            PartnerNameSurname.text = pN + " " + pS
            PartnerImage?.image = pI
            PartnerMobileNumber?.text = pMN
            PartnerEmail?.text = pE
           // PartnerBalance?.text = String(describing: partner.currentBalance)
            PartnerBalance?.text = String(describing: cb)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

//         //Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return 4
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
            let photo = PartnerImage?.image
        
            let nameSurname = PartnerNameSurname?.text ?? ""
            let mobile = PartnerMobileNumber?.text ?? " "
            let email = PartnerEmail?.text ?? ""
            let balance: Int? = (Int)((PartnerBalance?.text)!) ?? 0
            let balance2: Decimal = (Decimal)(balance!)
        
        partner = ThePartnerInfo(photo: photo, name: nameSurname, surname: "", mobileNumber: mobile, email: email, currentBalance: balance2)
    }
}
