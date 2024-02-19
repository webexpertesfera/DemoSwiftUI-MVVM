//
//  PaymentResponse.swift
//  manasik
//
//  Created by Sheheryar on 15/10/2022.
//

import Foundation

class PaymentResponseObject: Codable {
    var id, status: String?
    var amount, fee: Int?
    var currency: String?
    var refunded: Int?
    var refundedAt: String?
    var captured: Int?
    var capturedAt, voidedAt: String?
    var paymentResponseDescription, amountFormat, feeFormat, refundedFormat: String?
    var capturedFormat: String?
    var invoiceID: String?
    var ip: String?
    var callbackURL: String?
    var createdAt, updatedAt: String?
    var metadata: String?
    var source: Source?

}

class Source: Codable {
    var type, company, name, number: String?
    var gateway_id: String?
    var reference_number, token, message: String?
    var transaction_url: String?
}
