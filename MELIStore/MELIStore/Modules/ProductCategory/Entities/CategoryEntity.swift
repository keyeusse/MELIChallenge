//
//  CategoryEntity.swift
//  MELIStore
//
//  Created by Meli on 10/5/21.
//

import Foundation

struct CategoryEntity: Decodable, Identifiable {
    var id: String
    var name: String
}

struct CategoryDetail: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    
    init(category: CategoryEntity) {
        id = category.id
        name = category.name
        image = "https://static.wikia.nocookie.net/videojuego/images/9/9c/Imagen_no_disponible-0.png/revision/latest?cb=20170910134200"
    }
    
    //inizialize category object
    init() {
        id = ""
        name = ""
        image = ""
    }
}


