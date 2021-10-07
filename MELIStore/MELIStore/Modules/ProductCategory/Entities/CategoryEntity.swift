//
//  CategoryEntity.swift
//  MELIStore
//
//  Created by Meli on 10/5/21.
//

import Foundation

struct CategoryEntity: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
}

struct CategoryDetail: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    
    init(category: CategoryEntity) {
        id = category.id
        name = category.name
        image = category.image
    }
    
    //inizialize category object
    init() {
        id = ""
        name = ""
        image = ""
    }
}
