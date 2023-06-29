//
//  FriendsModel.swift
//  DemoAPI
//
//  Created by Thanh Dat on 26/06/2023.
//

import Foundation

struct FriendsModel: Codable {
    var fullName: String
    var nickName: String
    var avatar: String
    var phone: String
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "fullName"
        case nickName = "nickName"
        case avatar = "avatar"
        case phone = "phone"
        case id = "id"
    }
    
    init(phone: String, nickName: String, fullName: String, avatar: String, id: String) {
            self.phone = phone
            self.nickName = nickName
            self.fullName = fullName
            self.avatar = avatar
            self.id = id
        }
}
typealias Friends = [FriendsModel]
