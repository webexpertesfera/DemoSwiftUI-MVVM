//
//  PaymentObject.swift
//  manasik
//
//  Created by Sheheryar on 24/08/2022.
//

import Foundation

class PaymentObject: Codable {
    public var number, month, year, cvc: String?
    public var name,type,addOns: String?
    public var amount: Int?
    public var partial: Bool?

   
}
