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
    var result: [Product]
    
    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case paging
        case query = "query"
        case result = "results"
    }
    
    init() {
        siteId = ""
        query = ""
        paging = Paging()
        result = [Product]()
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
