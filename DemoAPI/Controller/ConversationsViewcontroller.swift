//
//  ConversationsViewcontroller.swift
//  DemoAPI
//
//  Created by Thanh Dat on 26/06/2023.
//

import UIKit

class ConversationsViewcontroller: UITableViewCell, UITableViewDelegate {
    
    @IBOutlet weak var tblConversations: UITableView!
    var conversationsData: [ConversationResponseModel] = []
    
    
    override func viewDidload() {
        super.viewDidLoad()

   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversationsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
