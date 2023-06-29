//
//  ConversationsTableViewController.swift
//  DemoAPI
//
//  Created by Thanh Dat on 26/06/2023.
//

import UIKit
import Kingfisher

class ConversationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblConversation: UITableView!
    
    var conversationsData: [ConversationResponseModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tblConversation.dataSource = self
        tblConversation.delegate = self
        tblConversation.register(UINib(nibName: "ConversationTableViewCell", bundle: nil), forCellReuseIdentifier: "ConversationCellIdentifier")
        callAPIGetConversations()
    }
    func callAPIGetConversations() {
        APIHandler.init().getConversations{ conversationsResponseData in
            self.conversationsData = conversationsResponseData
            self.tblConversation.reloadData()
        }
        
    }
    
 
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversationsData.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblConversation.dequeueReusableCell(withIdentifier: "ConversationCellIdentifier") as! ConversationTableViewCell
        cell.lblConversation.text = conversationsData[indexPath.row].name
         let avatarURL = URL(string: conversationsData[indexPath.row].avatar)
         cell.ImgConversation.kf.setImage(with: avatarURL)
        return cell
    }

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200

    }
}
