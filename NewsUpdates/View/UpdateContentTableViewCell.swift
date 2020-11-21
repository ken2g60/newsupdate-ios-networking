//
//  UpdateContentTableViewCell.swift
//  NewsUpdates
//
//  Created by knight on 10/15/20.
//

import UIKit

class UpdateContentTableViewCell: UITableViewCell {
    @IBOutlet weak var content: UITextView! {
        didSet {
            content.isEditable = false
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
