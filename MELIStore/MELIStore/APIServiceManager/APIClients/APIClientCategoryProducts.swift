//
//  APIClientCategoryProducts.swift
//  MELIStore
//
//  Created by Meli on 10/11/21.
//

import Foundation
import Alamofire

// MARK: - Protocols for call api to use product list response
protocol APIProductsByCategoryResponseProtocol {
    func getProductsByCategoryResult(data: Products)
    func onFailure(_ error: Error)
    func onIntenetFailure(_ error: String)
}

// MARK: - Protocols for response api calls
protocol APIClientCategoryProductsProtocol: AnyObject {

    func getProductsByCategoryList(url: APIServiceUrls, idCategory : String, siteId : APIProductSiteId)

}

// MARK: - Call to api services from Mercado libre
class APIClientCategoryProducts: APIClientCategoryProductsProtocol {

// MARK: - Protocols to responses
    var productsByCategoryDelegate: APIProductsByCategoryResponseProtocol?

    
    init() {}
        
//    Api call to load product list by category
    func getProductsByCategoryList(url: APIServiceUrls, idCategory: String, siteId: APIProductSiteId) {
        if(ConnectivityToIntenet.isConnectedToInternet){
            let URL = url.rawValue
            let replaceSite = URL.replacingOccurrences(of: "{siteId}", with: siteId.rawValue)
            let fullPathURL = replaceSite + idCategory

            AF.request(fullPathURL).validate().responseDecodable(of: Products.self) { (response) in
                switch response.result {
                case .success(let results):
                    self.productsByCategoryDelegate?.getProductsByCategoryResult(data: results)
                case .failure(let error):
                  self.productsByCategoryDelegate?.onFailure(error)
                }
            }
        } else {
            self.productsByCategoryDelegate?.onIntenetFailure(TextResources.noInternet.rawValue)
        }
    }

    // check connection to internet
    class ConnectivityToIntenet {
      class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
      }
    }
}

