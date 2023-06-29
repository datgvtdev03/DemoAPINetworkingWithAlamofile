//
//  AddFriendViewController.swift
//  DemoAPI
//
//  Created by Thanh Dat on 28/06/2023.
//

import UIKit

class AddFriendViewController: UIViewController {
    var item = FriendsModel(phone: "", nickName: "", fullName: "", avatar: "", id: "")
    
    var friend: Friends = []
    @IBOutlet weak var txtFullname: UITextField!
    
    @IBOutlet weak var txtNickname: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var txtAvatar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFullname.text = item.fullName
        txtPhone.text = item.phone
        txtNickname.text = item.nickName
        txtAvatar.text = item.avatar
        
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        if txtPhone.text != "" && txtAvatar.text != "" && txtFullname.text != "" && txtNickname.text != "" {
            if(item.id == "") {
                let addFriend = FriendsModel(phone: txtPhone.text ?? "", nickName: txtNickname.text ?? "", fullName: txtFullname.text ?? "", avatar: txtAvatar.text ?? "", id: "")
//                friend.append(addFriend)
                APIHandler.init().addFriends(_bodyRequest: addFriend)
                print("Them thanh cong")
            } else {
                let updateFriend = FriendsModel(phone: txtPhone.text ?? "", nickName: txtNickname.text ?? "", fullName: txtFullname.text ?? "", avatar: txtAvatar.text ?? "", id: "")
//                friend.append(updateFriend)
                APIHandler.init().putFriends(id: item.id, _bodyRequest: updateFriend)
                print("sua thanh cong")
            }
           
        } else {
            print("không để trống")
        }
        
    }
    
   

}
