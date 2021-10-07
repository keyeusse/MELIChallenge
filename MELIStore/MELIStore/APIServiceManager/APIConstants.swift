//
//  APIConstants.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import Foundation

// Headers to request
public struct HeaderRequest {
  let auth: String = "Authorization"
  let key: String = "157b108f1f2d275c12e9092b4b2bcdd9"
}

// Api urls to call api products
public enum APIServiceUrls: String {
  case categories = "https://api.mercadolibre.com/sites/{siteId}/categories"
  case category = "https://api.mercadolibre.com/categories/{id}"
  case searchProducts = "https://api.mercadolibre.com/sites/{siteId}/search?q={name}"
  case product = "https://api.mercadolibre.com/items/{idProduct}"
  case productDescription = "https://api.mercadolibre.com/items/{idProduct}/description"
}

public enum APIServiceParams: String {
  case key = "api_key"
  case lang = "language"
}

public enum APIProductSiteId: String {
  case mexico = "MCO"
}

public enum APIRequestMethod {
  case get
  case post
}

public enum APIRequestEncoding {
  case json
  case url
}

public enum APIResponseError: Error {
  case jsonMapping(String)
  case statusCode(Int)
  case badResponse(Any?)
  case unreachableNetwork
  case noNetworkConnection
  case timeout
}
