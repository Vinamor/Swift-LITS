//
//  TheNoteTableViewController.swift
//  Notebook
//
//  Created by Marta Romaniv on 30.10.16.
//  Copyright © 2016 Ostap Romaniv. All rights reserved.
//

import UIKit

class TheNoteTableViewController: UITableViewController {
    // MARK: Properties
    var notes = [TheNote]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loading  samples of Notes
        if let savedNotes = loadNotes() {
            notes += savedNotes
        } else {
            loadSampleNotes()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func loadSampleNotes() {
   //     let date = Calendar.current.date(from: DateComponents(year: 2016, month: 11, day: 3 + 1))
     
   //     let note1 = TheNote(date: date!, name: "Monday", text: "The Beginning", weather: 1)
   //     let note2 = TheNote(date: date!, name: "Tuesday", text:"The ardestDay", weather: 2)
   //     let note3 = TheNote(date: date!, name: "Wednesday", text: "The Other Hard Day", weather: 3)
        
   //     notes += [note1, note2, note3]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "TheNoteTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TheNoteTableViewCell
        
        let note = notes[indexPath.row]

        cell.nameLabel1?.text = note.name
        cell.nameLabel2?.text = String(describing: note.date)
        cell.nameLabel3?.text = note.name
        cell.nameLabel4?.text = String(describing: note.date)

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            notes.remove(at: indexPath.row)
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
        if segue.identifier == "ShowDetail" {
            let noteDetailViewController = segue.destination as! ViewController
            
            if let selectedNoteCell = sender as? TheNoteTableViewCell {
                let indexPath = tableView.indexPath(for: selectedNoteCell)!
                let selectedNote = notes[indexPath.row]
                noteDetailViewController.note = selectedNote
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new note")
            
        }
    }
    

    @IBAction func unwindToTheNoteList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? ViewController, let note = sourceViewController.note {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                notes[selectedIndexPath.row] = note
                
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                
            } else {
                
            let newIndexPath = NSIndexPath(row: notes.count, section: 0)
                
            notes.append(note)
                
            tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
                
            }
            
            saveNotes()
        }
    }
    
    // MARK: NSCoding
    func saveNotes() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(notes, toFile: TheNote.ArchiveURL.path)
        if !isSuccessfulSave {
            print("Failed to save notes...")
        }
    }
    
    func loadNotes() -> [TheNote]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: TheNote.ArchiveURL.path) as? [TheNote]
    }
    
}
