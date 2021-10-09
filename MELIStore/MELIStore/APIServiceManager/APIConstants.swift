//
//  APIConstants.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import Foundation

/*URLs examples*/
//"https://api.mercadolibre.com/sites/MCO/categories"
//"https://api.mercadolibre.com/categories/MCO1747"
//"https://api.mercadolibre.com/sites/MCO/search?q=Acc.%20para%20Motos%20y%20Cuatrimotos"
//"https://api.mercadolibre.com/items/MCO578271575"
//"https://api.mercadolibre.com/items/MCO578271575/description"

// Api urls to call api products
public enum APIServiceUrls: String {
  case categoriesAll = "https://api.mercadolibre.com/sites/{siteId}/categories"
  case categoryInfo = "https://api.mercadolibre.com/categories/"
  case categoryProducts = "https://api.mercadolibre.com/sites/{siteId}/search?category="
  case product = "https://api.mercadolibre.com/items/{idProduct}"
  case productDescription = "https://api.mercadolibre.com/items/{idProduct}/description"
}

//Sites or countries identifiers
public enum APIProductSiteId: String {
  case mexico = "MCO"
}

public enum APIResponseError: Error {
  case jsonMapping(String)
  case statusCode(Int)
  case badResponse(Any?)
  case unreachableNetwork
  case noNetworkConnection
  case timeout
}
