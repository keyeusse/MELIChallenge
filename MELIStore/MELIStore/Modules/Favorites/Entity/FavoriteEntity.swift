//
//  FavoriteEntity.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import Foundation

// VIPER ENTITY
struct Favorite: Codable, Identifiable {
    var id: String
    var name: String
    var price: String
    var fees : String
    var image : String
    
    init() {
        id = ""
        name = ""
        price = ""
        fees = ""
        image = ""
    }
}
