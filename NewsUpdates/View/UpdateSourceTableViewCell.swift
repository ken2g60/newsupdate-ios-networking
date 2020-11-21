//
//  UpdateSourceTableViewCell.swift
//  NewsUpdates
//
//  Created by knight on 10/15/20.
//

import UIKit

class UpdateSourceTableViewCell: UITableViewCell {

    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var publisher: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
