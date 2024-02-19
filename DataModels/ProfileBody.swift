//
//  ProfileBody.swift
//  manasik
//
//  Created by Sheheryar on 25/07/2022.
//
import Foundation

struct ProfileObject: Codable {
    public var numberOfservices: Int?
    public var _id: String?
    public var userId: Int?
    public var phone: Int?
    public var email: String?
    public var host, company: Bool?
    public var role: String?
    public var otp, balance: Int?
    public var verify: Bool?
    public var verifyEmail: Bool?
    public var status: String?
    public var block: Bool?
    public var __v: Int?
    public var dob: String?
    public var file: String?
    public var address, commId,deviceToken, firstName, lastName: String?
    public var nationality, requestedAt: String?

}

struct requestForVendor: Codable {
    public var msg: String?
    public var vender: ProfileObject?
}

struct favUnfav: Codable {
    public var msg: String?
}
