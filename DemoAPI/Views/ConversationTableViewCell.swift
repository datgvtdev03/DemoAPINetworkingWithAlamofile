//
//  ConversationTableViewCell.swift
//  DemoAPI
//
//  Created by Thanh Dat on 26/06/2023.
//

import UIKit

class ConversationTableViewCell: UITableViewCell {

    @IBOutlet weak var ImgConversation: UIImageView!
    
    @IBOutlet weak var lblConversation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
