//
//  ViewController.swift
//  Notebook
//
//  Created by Marta Romaniv on 30.10.16.
//  Copyright © 2016 Ostap Romaniv. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
   // @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chooseWeather: UISegmentedControl?
    @IBOutlet weak var nameTextField1: UITextField!
    @IBOutlet weak var nameTextField2: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    @IBAction func chooseSegment(_ sender: UISegmentedControl) {
    }
    
    var note: TheNote?
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func checkValidNoteName() {
        let text1 = nameTextField1.text ?? ""
        let text2 = nameTextField2.text ?? ""
        
        saveButton.isEnabled = !text1.isEmpty
        saveButton.isEnabled = !text2.isEmpty
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidNoteName()
       // navigationItem.title = textField.text
     //   nameLabel.text = String(describing: note?.date)
     //  chooseWeather?.selectedSegmentIndex = (note?.weatherSegment)!
    }
 
    
    // MARK: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        let isPresentingInAddNoteMode = presentingViewController is UINavigationController
        
        if isPresentingInAddNoteMode {
            
            dismiss(animated: true, completion: nil)
            
        } else {
            
            navigationController!.popViewController(animated: true)
            
        }
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
         if (saveButton != nil) {
                let date = Calendar.current.date(from: DateComponents(year: 2016, month: 11, day: 3 + 1))!
                let text1 = nameTextField1.text ?? ""
                let text2 = nameTextField2.text ?? ""
                let weather = chooseWeather?.selectedSegmentIndex
            
            note = TheNote(date: date, name: text1, text: text2, weather: weather)
            }

        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameTextField1.delegate = self
        nameTextField2.delegate = self
        
       /*
            if let note = note {
            navigationItem.title = String(describing: note.date)
            nameTextField1.text = note.name
            nameTextField2.text = note.text
            chooseWeather?.selectedSegmentIndex = note.weather!
        }
        */
        if let note = note, let weath = note.weather {
            navigationItem.title = String(describing: note.date)
            nameTextField1.text = note.name
            nameTextField2.text = note.text
            chooseWeather?.selectedSegmentIndex = weath
        }
        
        checkValidNoteName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

