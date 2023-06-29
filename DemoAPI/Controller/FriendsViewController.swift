//
//  FriendsViewController.swift
//  DemoAPI
//
//  Created by Thanh Dat on 26/06/2023.
//

import UIKit
import Kingfisher

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tblFriends: UITableView!
    var friendsData: [FriendsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFriends.dataSource = self
        tblFriends.delegate = self
        tblFriends.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendCellIdentifier")
        callAPIGetFriends()
        tblFriends.reloadData()
    }
    
    //khi den man nay thi goi lai api
    override func viewWillAppear(_ animated: Bool) {
        callAPIGetFriends()
    }
    
    func callAPIGetFriends() {
        APIHandler.init().getFriends { friendsResponseData in
            self.friendsData = friendsResponseData
            self.tblFriends.reloadData()
        }
    }
    
    func callAPIDeleteFriend(indexPath: IndexPath) {
//         hàm callAPIDeleteFriend(indexPath:),kiểm tra xem friendIndex có hợp lệ hay không. Nếu hợp lệ, chúng ta gọi APIHandler để xóa bạn bè với friendId tương ứng
        let friendIndex = indexPath.row
        APIHandler.init().deleteFriends(id: friendsData[friendIndex].id)
        print("deleteled: \(friendsData[friendIndex].id)")
    }
                                         
//    @IBAction func btnAddFrend(_ sender: Any) {
//        let objViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddFriendViewController") as! AddFriendViewController
//        self.navigationController?.pushViewController(objViewController, animated: true)
//    }
//    
                                            
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriends.dequeueReusableCell(withIdentifier: "FriendCellIdentifier") as! FriendsTableViewCell
        cell.lblfullName.text = friendsData[indexPath.row].fullName
        cell.lblNickName.text = friendsData[indexPath.row].nickName
        cell.lblSDT.text = friendsData[indexPath.row].phone
        let avatarURL = URL(string: friendsData[indexPath.row].avatar)
        cell.imgFriendAvatar.kf.setImage(with: avatarURL)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        kiểm tra editingStyle để xác định xem người dùng đã chọn thao tác xóa hay không. Nếu là thao tác xóa (editingStyle == .delete), chúng ta gọi hàm callAPIDeleteFriend(indexPath:).
        if editingStyle == .delete {
                callAPIDeleteFriend(indexPath: indexPath)
            }
          friendsData.remove(at: indexPath.row)
          tblFriends.reloadData()
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addFriendVC = self.storyboard?.instantiateViewController(withIdentifier: "AddFriendViewController") as! AddFriendViewController
        addFriendVC.item = friendsData[indexPath.row]
        self.navigationController?.pushViewController(addFriendVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
