//
//  APIClient.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import Foundation
import Alamofire

// MARK: - Protocols for call api to use response
protocol APICategoriesResponseProtocol {
    func getCategoriesResult(data: [CategoryEntity])
    func onFailure(_ error: Error)
}

protocol APICategoryResponseProtocol {
    func getCategoryResult(data: CategoryDetail)
    func onFailure(_ error: Error)
}

protocol APIProductsByCategoryResponseProtocol {
    func getProductsByCategoryResult(data: Products)
    func onFailure(_ error: Error)
}

protocol APIProductResponseProtocol {
    func getProductResult(data: Product)
    func onFailure(_ error: Error)
}

protocol APISearchProductsResponseProtocol {
    func getproductSearchResult(data: Products)
    func onFailure(_ error: Error)
}

protocol APIProductDescriptionResponseProtocol {
    func getproductDescription(data: ProductDetailDescription)
    func onFailure(_ error: Error)
}

protocol APIClientProtocol: AnyObject {
  func getAllCategoriesList(url: APIServiceUrls, siteId : APIProductSiteId)
    func getCategoryList(url: APIServiceUrls, idCategory : String)
    func getProductsByCategoryList(url: APIServiceUrls, idCategory : String, siteId : APIProductSiteId)
    func getProductDetail(url: APIServiceUrls, idProduct : String)
    func getProductsSearchList(url: APIServiceUrls, categoryName : String, siteId : APIProductSiteId)
    func getProductDetailDescription(url: APIServiceUrls, siteId : APIProductSiteId)
}



// MARK: - Call to api services from Mercado libre
class APIClient: APIClientProtocol {

// MARK: - Protocols to responses
    var categoriesDelegate: APICategoriesResponseProtocol?
    var categoryDelegate: APICategoryResponseProtocol?
    var productsByCategoryDelegate: APIProductsByCategoryResponseProtocol?
    var productDelegate: APIProductResponseProtocol?
    var productSearchDelegate: APISearchProductsResponseProtocol?
    var productDescriptionDelegate: APIProductDescriptionResponseProtocol?
    
    
    init() {}
    
//  Api call to all categories
    func getAllCategoriesList(url: APIServiceUrls, siteId: APIProductSiteId) {
        let URL = url.rawValue
        let fullPathURL = URL.replacingOccurrences(of: "{siteId}", with: siteId.rawValue)
        
        AF.request(fullPathURL).validate().responseDecodable(of: [CategoryEntity].self) { (response) in
            switch response.result {
            case .success(let results):
              self.categoriesDelegate?.getCategoriesResult(data: results)
            case .failure(let error):
              self.categoriesDelegate?.onFailure(error)
            }
        }
    }
    
//    Api call to load ifo about categories
    func getCategoryList(url: APIServiceUrls, idCategory: String) {
        let URL = url.rawValue
        let fullPathURL = URL + idCategory
        
        AF.request(fullPathURL).validate().responseDecodable(of: CategoryDetail.self) { (response) in
            switch response.result {
            case .success(let results):
              self.categoryDelegate?.getCategoryResult(data: results)
            case .failure(let error):
              self.categoryDelegate?.onFailure(error)
            }
        }
    }
    
//    Api call to load product list by category
    func getProductsByCategoryList(url: APIServiceUrls, idCategory: String, siteId: APIProductSiteId) {
        let URL = url.rawValue
        let replaceSite = URL.replacingOccurrences(of: "{siteId}", with: siteId.rawValue)
        let fullPathURL = replaceSite + idCategory
        
        AF.request(fullPathURL).validate().responseDecodable(of: Products.self) { (response) in
            switch response.result {
            case .success(let results):
                self.productsByCategoryDelegate?.getProductsByCategoryResult(data: results)
                print(results)
            case .failure(let error):
              self.productsByCategoryDelegate?.onFailure(error)
            }
        }
    }
    
//  Api call to load product detail by id
    func getProductDetail(url: APIServiceUrls, idProduct: String) {
        let fullPathURL = url.rawValue + idProduct
        
        AF.request(fullPathURL).validate().responseDecodable(of: Product.self) { (response) in
            switch response.result {
            case .success(let results):
                self.productDelegate?.getProductResult(data: results)
            case .failure(let error):
              self.productDelegate?.onFailure(error)
            }
        }
    }
    
//    Api call for searching products
    func getProductsSearchList(url: APIServiceUrls, categoryName: String, siteId : APIProductSiteId) {
        let URL = url.rawValue
        let replaceSite = URL.replacingOccurrences(of: "{siteId}", with: siteId.rawValue)
        let replaceBlankSpace = replaceSite.replacingOccurrences(of: " ", with: "%")
        let fullPathURL = replaceBlankSpace + categoryName
        
        AF.request(fullPathURL).validate().responseDecodable(of: Products.self) { (response) in
            switch response.result {
            case .success(let results):
                self.productSearchDelegate?.getproductSearchResult(data: results)
            case .failure(let error):
              self.productSearchDelegate?.onFailure(error)
            }
        }
    }
    
//    Api call for product description
    func getProductDetailDescription(url: APIServiceUrls, siteId: APIProductSiteId) {
        let URL = url.rawValue
        let replaceSite = URL.replacingOccurrences(of: "{siteId}", with: siteId.rawValue)
        
        AF.request(replaceSite).validate().responseDecodable(of: ProductDetailDescription.self) { (response) in
            switch response.result {
            case .success(let results):
                self.productDescriptionDelegate?.getproductDescription(data: results)
            case .failure(let error):
              self.productDescriptionDelegate?.onFailure(error)
            }
        }
    }
    
    // check connection to internet
    class ConnectivityToIntenet {
      class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
      }
    }
}
