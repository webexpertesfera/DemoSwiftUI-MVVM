//
//  Resort.swift
//  manasik
//
//  Created by Sheheryar on 19/08/2022.
//

import Foundation

class Resort: Codable, ObservableObject {
    
    static func == (_: Resort, _: Resort) -> Bool {
        return true
    }
    public var roomsGuest: RoomsGuest?
    public var leisure: Leisuree?
    public var LeisureWeddingHalls: LeisureWeddingHalls?
    public var Leisurelounge: Leisurelounge?
    public var roomsbath: Roomsbath?
    public var kitchen: Kitchen?
    public var outdoors: Outdoors?
    public var description: ResortDescription?
    public var address: Address?
    public var price: Price?
    public var check: Check?
    public var bookingSetting: BookingSetting?
    public var addOns: AddOns?
    public var _id, categoryId, vender: String?
    public var fav: [String]?
    public var available, totalEntities: Int?
    public var reviews: [ReviewsObject]?
    public var terms: String?
    public var location: Location?
    public var v: Int?

    
  
}

class ResortDescription: Codable {
    var rules: Rules?
    var safty: Safty?
    var nameInEnglish, nameInArabic, descriptionInEnglish, descriptionInArabic: String?
    var secondryPhone: Int?
    var images: [String]?
    var areaSqm: Int?
}




class RoomsGuest: Codable,  ObservableObject {
    
    static func == (_: RoomsGuest, _: RoomsGuest) -> Bool {
        return true
    }
    public var roomType: String?
    public var section, doubleBed,numRooms,bedrooms,singleBed,maleRooms,femaleRooms,maxSittingCapacity, stands,dressingRooms,numberOfUnits: Int?
    public var indoorSeating, outdoorSeating, livingRoom,additionSeating: Bool?
    public var bathrooms, maxGuest, numOfTents,numberOfAdult,childrenAllowed,numberOfChild, numOfMajlesTents: Int?
}
