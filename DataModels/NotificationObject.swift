//
//  NotificationObject.swift
//  manasik
//
//  Created by Sheheryar on 01/10/2022.
//

import Foundation

class NotificationObject: Codable {
    var _id, title,title_ar,type,description,description_ar, user: String?
    var __v: Int?
    var read: Bool?
    
}


struct readNotificationObject: Codable {
    var _id, title,title_ar, description,description_ar, user: String?
    public var read: Bool?
}

//class NotificationObject: Codable {
//    var _id, title, descripton, user: String?
//    var __v: Int?
//    var read: Bool?
//    
//}
