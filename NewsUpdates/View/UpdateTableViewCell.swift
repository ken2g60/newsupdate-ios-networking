//
//  HealthTipsTableViewCell.swift
//  HealthT
//
//  Created by knight on 10/12/20.
//

import UIKit

class UpdateTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel! {
        didSet{
            title.adjustsFontSizeToFitWidth = true
            title.minimumScaleFactor = 0.5
        }
    }
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var category: UILabel! {
        didSet {
            category.adjustsFontSizeToFitWidth = true
            category.minimumScaleFactor = 0.5
        }
    }
    
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
