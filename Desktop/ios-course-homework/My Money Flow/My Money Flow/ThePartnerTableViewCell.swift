//
//  ThePartnerTableViewCell.swift
//  My Money Flow
//
//  Created by Marta Romaniv on 03.12.16.
//  Copyright © 2016 Ostap Romaniv. All rights reserved.
//

import UIKit

class ThePartnerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var PartnerNameSurname: UILabel?
    @IBOutlet weak var PartnerBalance: UILabel?
    @IBOutlet weak var PartnerImage: UIImageView?
    
    @IBOutlet weak var PartnerNameSurname2: UILabel?
    @IBOutlet weak var PartnerImage2: UIImageView?
    @IBOutlet weak var PartnerBalance2: UILabel!
 

  
    
    override func awakeFromNib() {
    
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
