//
//  MainDetailsTableViewCell.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import UIKit

class MainDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    static let reuseIdentifier = "detailsViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)

    }

    func configUI(user: CaibaDetailsModels.Posts.Response){
        titleLabel.text   = user.title
        bodyLabel.text    = user.body
    }
    
}
