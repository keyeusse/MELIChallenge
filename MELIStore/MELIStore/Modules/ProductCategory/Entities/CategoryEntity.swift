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
    
    //This is being used only for SwiftUI preview in order to keep the beneffits of this tool
    init() {
        id = ""
        name = ""
        picture = ""
    }
}


