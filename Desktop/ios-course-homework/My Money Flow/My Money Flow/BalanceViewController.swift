//
//  BalanceViewController.swift
//  My Money Flow
//
//  Created by Marta Romaniv on 06.12.16.
//  Copyright © 2016 Ostap Romaniv. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {
    
    var note: TheReportNote?
    
    
    
    @IBOutlet weak var theSumTextField: UITextField?
    @IBOutlet weak var theDatePicker: UIDatePicker?
    

    @IBOutlet weak var saveButton: UIBarButtonItem!
  
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else {
            navigationController!.popViewController(animated: true)
        }
    }
    
    
//    @IBAction func cancel1(_ sender: UIBarButtonItem) {
//        let isPresentingInAddMealMode = presentingViewController is UINavigationController
//        
//        if isPresentingInAddMealMode {
//            dismiss(animated: true, completion: nil)
//        }
//        else {
//            navigationController!.popViewController(animated: true)
//        }
//    }
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let note = note {
            
            theSumTextField?.text = String(describing: note.sum)
            theDatePicker?.date = note.date!
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //let date = theSumTextField?.text ?? ""
        //let date = Calendar.current.date(from: DateComponents(year: 2016, month: 10, day: 22))
        
        let date = theDatePicker?.date
        
        let sumHelper: Int? = (Int)((theSumTextField?.text)!) ?? 0
        let sum: Decimal? = (Decimal)((sumHelper)!) 
        
        note = TheReportNote(date: date, sum: sum)
    }
}



