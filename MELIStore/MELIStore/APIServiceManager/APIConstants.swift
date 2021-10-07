//
//  APIConstants.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import Foundation


// Api urls to call api products
public enum APIServiceUrls: String {
  case categoriesAll = "https://api.mercadolibre.com/sites/{siteId}/categories"
  case categoryInfo = "https://api.mercadolibre.com/categories/{id}"
  case categoryProducts = "https://api.mercadolibre.com/sites/{siteId}/search?q={categoryName}"
  case product = "https://api.mercadolibre.com/items/{idProduct}"
  case productDescription = "https://api.mercadolibre.com/items/{idProduct}/description"
}

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
