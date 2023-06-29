//
//  APIHandler.swift
//  DemoAPI
//
//  Created by Thanh Dat on 26/06/2023.
//

import Foundation
import Alamofire

//Chịu trách nhiệm làm việc với API
class APIHandler {
    //Hàm này chịu trách nhiệm gọi API lấy ra danh sách các cuộc hội thoại
    func getConversations(completion: @escaping
            (Conversations) -> ()) {
                AF.request("https://647df49daf984710854aad33.mockapi.io/conversations", method: .get).responseDecodable(of: Conversations.self) {
                    (response) in
                    if let conversationsResponse = response.value {
                       completion(conversationsResponse)
                    }
            }
    }
    

//    Hàm này chịu trách nhiệm lấy ra danh sách bạn bè
    func getFriends(completion: @escaping
            (Friends) -> ()) {
                AF.request("https://647df67daf984710854ab269.mockapi.io/Friends", method: .get).responseDecodable(of: Friends.self) {
                    (response) in
                    if let friendsResponse = response.value {
                       completion(friendsResponse)
                    }
            }
    }
    
//    Hàm này chịu trách nhiệm thêm bạn bè
    func addFriends(_bodyRequest: FriendsModel) {
        AF.request("https://647df67daf984710854ab269.mockapi.io/Friends",
                   method: .post, parameters: _bodyRequest).responseDecodable(of: Friends.self) {
            (response) in
        }
    }
    
//    Hàm này chịu trách nhiệm xoá bạn bè
    func deleteFriends(id: String) {
                AF.request("https://647df67daf984710854ab269.mockapi.io/Friends/\(id)", method: .delete).responseDecodable(of: Friends.self) {
                    (response) in
                    }
            }
//    Hàm này chịu trách nhiệm sửa thông tin bạn bè
    func putFriends(id: String, _bodyRequest: FriendsModel) {
                AF.request("https://647df67daf984710854ab269.mockapi.io/Friends/\(id)",
                           method: .put, parameters: _bodyRequest).responseDecodable(of: Friends.self) {
                    (response) in
                    }
            }
    }

