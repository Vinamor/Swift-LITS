//
//  BalanceTableViewController.swift
//  My Money Flow
//
//  Created by Marta Romaniv on 06.12.16.
//  Copyright © 2016 Ostap Romaniv. All rights reserved.
//

import UIKit

class BalanceTableViewController: UITableViewController {
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else {
            navigationController!.popViewController(animated: true)
        }
    }

    var notes = [TheReportNote]()
    
 
    func loadSampleNotes() {
        let date = Calendar.current.date(from: DateComponents(year: 2016, month: 10, day: 22))
        let note1 = TheReportNote(date: date, sum: 1200)
        let note2 = TheReportNote(date: date, sum: 1550)
        let note3 = TheReportNote(date: date, sum: 3750)
        
        notes += [note1, note2, note3]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let savedNotes = loadNotes() {
            notes += savedNotes
        } else {
            // Load the sample data.
            loadSampleNotes()
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
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "BalanceTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BalanceTableViewCell
        

        // Configure the cell...
        let note = notes[indexPath.row]
        
        if let nD = note.date, let nS = note.sum {
        
        cell.theDateLabel.text = String(describing: nD)
        cell.theSumLabel.text = String(describing: nS)
        
        navigationItem.title = String(describing: balance(array: &notes))
        }
        return cell
    }
    
      func balance( array: inout [TheReportNote]) -> Decimal {
         var sum: Decimal = 0
        
        for i in array {
            if let summ = i.sum {
           
            sum += summ
            }
        }
        return sum
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
            notes.remove(at: indexPath.row)
            saveNotes()
            tableView.deleteRows(at: [indexPath], with: .fade)
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
            let noteDetailViewController = segue.destination as! BalanceViewController
            
            // Get the cell that generated this segue.
            if let selectedBalanceCell = sender as? BalanceTableViewCell {
                let indexPath = tableView.indexPath(for: selectedBalanceCell)!
                let selectedNote = notes[indexPath.row]
                noteDetailViewController.note = selectedNote
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new monetary event.")
        }
    }
    
    @IBAction func unwindToNotesList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? BalanceViewController, let note = sourceViewController.note {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                notes[selectedIndexPath.row] = note
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // Add a new Monetary Event.
                let newIndexPath = NSIndexPath(row: notes.count, section: 0)
                notes.append(note)
                tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
            }
            saveNotes()
        }
    }
    // MARK: NSCoding
    func saveNotes() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(notes, toFile: TheReportNote.ArchieveURL!.path)
        if !isSuccessfulSave {
            print("Failed to save list of notes...")
        }
    }
    
    func loadNotes() -> [TheReportNote]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: TheReportNote.ArchieveURL!.path) as? [TheReportNote]
    }
}
