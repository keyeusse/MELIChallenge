//
//  CategoryEntity.swift
//  MELIStore
//
//  Created by Meli on 10/5/21.
//

import Foundation

struct CategoryEntity: Codable {
    var id: String
    var name: String
    
    init() {
        id = ""
        name = ""
    }
}

struct CategoryDetail: Codable {
    var id: String
    var name: String
    var picture: String
    
    init(category: CategoryEntity) {
        id = category.id
        name = category.name
        picture = ""
    }
    
    init() {
        id = ""
        name = ""
        picture = ""
    }
}


