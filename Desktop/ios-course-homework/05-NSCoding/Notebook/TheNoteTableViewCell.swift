//
//  TheNoteTableViewCell.swift
//  Notebook
//
//  Created by Marta Romaniv on 30.10.16.
//  Copyright © 2016 Ostap Romaniv. All rights reserved.
//

import UIKit

class TheNoteTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var nameLabel1: UILabel?
    @IBOutlet weak var nameLabel2: UILabel?
    @IBOutlet weak var nameLabel3: UILabel?
    @IBOutlet weak var nameLabel4: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
