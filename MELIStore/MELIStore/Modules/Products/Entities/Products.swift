//
//  Products.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import Foundation

struct Product: Codable, Identifiable {
    var id: String
    var siteId: String
    var title: String
    var price: Double
    var currency: String
    var availability: Int?
    var soldQuantity: Int?
    var image: String?
    var installments: Installment?
    var shipping: Shipping?

    enum CodingKeys: String, CodingKey {
        case id
        case siteId = "site_id"
        case title
        case price
        case currency = "currency_id"
        case availability = "available_quantity"
        case soldQuantity = "sold_quantity"
        case image = "thumbnail"
        case installments
        case shipping
    }
    
    //This is being used only for SwiftUI preview in order to keep the beneffits of this tool
    init() {
        id = ""
        siteId = ""
        title = ""
        price = 0
        currency = ""
    }
}

struct Installment: Codable {
    var quantity: Int
    var amount: Double
    var rate: Double
    var currency: String
    
    enum CodingKeys: String, CodingKey {
        case quantity
        case amount
        case rate
        case currency =  "currency_id"
    }
}

struct Shipping: Codable {
    
    var freeShipping: Bool
    var storePickUp: Bool
    
    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case storePickUp = "store_pick_up"
    }
}
