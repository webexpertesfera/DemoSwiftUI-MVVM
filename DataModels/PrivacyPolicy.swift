//
//  PrivacyPolicy.swift
//  manasik
//
//  Created by Esfera-Macmini on 27/02/23.
//

import Foundation

class PrivacyPolicy: Codable {
    var id: String?
    var privacyPolicy: [PrivacyPolicyy]?
    var createdAt, updatedAt: String?
    var __v: Int?

}

class PrivacyPolicyy: Codable {
    var title, title_ar, text,text_ar, _id: String?
}
