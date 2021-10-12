//
//  APIClientSearhProducts.swift
//  MELIStore
//
//  Created by Meli on 10/11/21.
//

import Foundation
import Alamofire


// MARK: - Protocols for call api to use searched products response
protocol APISearchProductsResponseProtocol {
    func getproductSearchResult(data: Products)
    func onFailure(_ error: Error)
    func onIntenetFailure(_ error: String)
}

// MARK: - Protocols for response api calls
protocol APIClientSearchProductsProtocol: AnyObject {
    func getProductsSearchList(url: APIServiceUrls, categoryName : String, siteId : APIProductSiteId)
}


// MARK: - Call to api services from Mercado libre
class APIClientSearchProducts: APIClientSearchProductsProtocol {

// MARK: - Protocols to responses
    var productSearchDelegate: APISearchProductsResponseProtocol?
    
    init() {}
        

//    Api call for searching products
    func getProductsSearchList(url: APIServiceUrls, categoryName: String, siteId : APIProductSiteId) {
        if(ConnectivityToIntenet.isConnectedToInternet){
            let URL = url.rawValue
            let replaceSite = URL.replacingOccurrences(of: "{siteId}", with: siteId.rawValue)
            let replaceBlankSpace = categoryName.replacingOccurrences(of: " ", with: "")
            let fullPathURL = replaceSite + replaceBlankSpace

            AF.request(fullPathURL).validate().responseDecodable(of: Products.self) { (response) in
                switch response.result {
                case .success(let results):
                    self.productSearchDelegate?.getproductSearchResult(data: results)
                case .failure(let error):
                  self.productSearchDelegate?.onFailure(error)
                }
            }
        } else {
            self.productSearchDelegate?.onIntenetFailure(TextResources.noInternet.rawValue)
        }
    }

    // check connection to internet
    class ConnectivityToIntenet {
      class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
      }
    }
}

