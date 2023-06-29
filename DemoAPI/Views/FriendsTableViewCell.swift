//
//  FriendsTableViewCell.swift
//  DemoAPI
//
//  Created by Thanh Dat on 26/06/2023.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgFriendAvatar: UIImageView!
    
    @IBOutlet weak var lblfullName: UILabel!
    
    @IBOutlet weak var lblNickName: UILabel!
    
    @IBOutlet weak var lblSDT: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
