//
//  MainTableViewCell.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 2/12/21.
//

import UIKit

class MainTableViewCell: UITableViewCell {

  
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var emailUserLabel: UILabel!
    
    static let reuseIdentifier = "mainViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)

    }
    
    func configUI(user: CaibaModels.GetMain.Response){
        
        nameLabel.text      = user.name
        numberLabel.text    = user.phone
        emailUserLabel.text = user.email
    }   
}
