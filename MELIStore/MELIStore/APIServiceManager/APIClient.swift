//
//  APIClient.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import Foundation
import Alamofire

protocol APIResponseProtocol {
    func getCategoriesResult(data: CategoryEntity)
    func getCategoryResult(data: CategoryDetail)
    func getProductsByCategoryResult(data: Products)
    func getProductResult(data: Product)
    func getproductSearchResult(data: Products)
    func onFailure(_ error: Error)
}

protocol APIClientProtocol: AnyObject {
  func getAllCategoiesList(url: APIServiceUrls)
    func getCategoryList(url: APIServiceUrls, idCategory : String)
    func getProductsByCategoryList(url: APIServiceUrls, idCategory : String)
    func getProductDetail(url: APIServiceUrls, idProduct : String)
    func getProductsSearchList(url: APIServiceUrls, categoryName : String)
}


/*
// MARK: - Call to api services movies and genres
class APIClient: APIClientProtocol {
    
//    call api service for searching products
    func getProductsSearchList(url: APIServiceUrls, categoryName: String) {
        
    }
    
//    call api service to list all categories
    func getAllCategoiesList(url: APIServiceUrls) {
        let URL = url.rawValue
//        let fullPathURL = URL.replacingOccurrences(of: "{siteId}", with: siteId)
        
        let response = Alamofire.request(URL)
        
        print(response)
    }
    
//    Call api service to list category with details
    func getCategoryList(url: APIServiceUrls, idCategory: String) {
        <#code#>
    }
    
//    call api service to list products by category id
    func getProductsByCategoryList(url: APIServiceUrls, idCategory: String) {
        <#code#>
    }
    
//    call api service to load details for selected product
    func getProductDetail(url: APIServiceUrls, idProduct: String) {
        <#code#>
    }
    
  
  var delegate: APIResponseProtocol?
  
  init() {}

// check connection to internet
class ConnectivityToIntenet {
  class var isConnectedToInternet: Bool {
    return NetworkReachabilityManager()?.isReachable ?? false
  }
}
    
}
 */
