//
//  Products.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import Foundation

struct Products: Codable {
    var siteId: String
    var paging: Paging
    var result: [Product]
    
    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case paging
        case result = "results"
    }
}

enum ProductServiceType {
    case categoryProducts
    case searchProducts
}

struct Paging: Codable {
    var total: Int
    var offset: Int
    var limit: Int
    var primaryResults: Int
    
    enum CodingKeys: String, CodingKey {
        case total
        case offset
        case limit
        case primaryResults = "primary_results"
    }
}
