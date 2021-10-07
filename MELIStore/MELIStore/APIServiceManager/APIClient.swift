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
  func getAllCategoriesList(url: APIServiceUrls, siteId : String)
    func getCategoryList(url: APIServiceUrls, idCategory : String)
    func getProductsByCategoryList(url: APIServiceUrls, idCategory : String, siteId : String)
    func getProductDetail(url: APIServiceUrls, idProduct : String)
    func getProductsSearchList(url: APIServiceUrls, categoryName : String, siteId : String)
}



// MARK: - Call to api services from Mercado libre
class APIClient: APIClientProtocol {
    
    var delegate: APIResponseProtocol?
    
    init() {}
    
//  Api call to all categories
    func getAllCategoriesList(url: APIServiceUrls, siteId: String) {
        let URL = url.rawValue
        let fullPathURL = URL.replacingOccurrences(of: "{siteId}", with: siteId)
        
        AF.request(fullPathURL).validate().responseDecodable(of: CategoryDetail.self) { (response) in
          guard let categories = response.value else { return }
        }
    }
    
//    Api call to load ifo about categories
    func getCategoryList(url: APIServiceUrls, idCategory: String) {
        let URL = url.rawValue
        let fullPathURL = URL + idCategory
        
        AF.request(fullPathURL).validate().responseDecodable(of: CategoryEntity.self) { (response) in
          guard let category = response.value else { return }
        }
    }
    
//    Api call to load product list by category
    func getProductsByCategoryList(url: APIServiceUrls, idCategory: String, siteId: String) {
        let URL = url.rawValue
        let replaceSite = URL.replacingOccurrences(of: "{siteId}", with: siteId)
        let fullPathURL = replaceSite + idCategory
        
        AF.request(fullPathURL).validate().responseDecodable(of: Products.self) { (response) in
          guard let category = response.value else { return }
        }
    }
    
//  Api call to load product detail by id
    func getProductDetail(url: APIServiceUrls, idProduct: String) {
        let fullPathURL = url.rawValue + idProduct
        
        AF.request(fullPathURL).validate().responseDecodable(of: Product.self) { (response) in
          guard let product = response.value else { return }
        }
    }
    
//    Api call for searching products
    func getProductsSearchList(url: APIServiceUrls, categoryName: String, siteId : String) {
        let URL = url.rawValue
        let replaceSite = URL.replacingOccurrences(of: "{siteId}", with: siteId)
        let fullPathURL = replaceSite + categoryName
        
        AF.request(fullPathURL).validate().responseDecodable(of: Products.self) { (response) in
          guard let products = response.value else { return }
        }
    }
    
    // check connection to internet
    class ConnectivityToIntenet {
      class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
      }
    }
}
