//
//  Products.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import Foundation

//VIPER Entity: models for api response
struct Products: Codable {
    var siteId: String
    var paging: Paging
    let query: String?
    var results: [Product]
    
    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case paging
        case query = "query"
        case results = "results"
    }
    
    init() {
        siteId = ""
        query = ""
        paging = Paging()
        results = [Product]()
    }
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
    
    init() {
        total = 100
        offset = 0
        limit = 4
        primaryResults = 0
        
    }
}
