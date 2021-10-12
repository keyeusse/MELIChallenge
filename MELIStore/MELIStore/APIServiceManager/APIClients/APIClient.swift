//
//  APIClient.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import Foundation
import Alamofire

// MARK: - Protocols for call api to use categories response
protocol APICategoriesResponseProtocol {
    func getCategoriesResult(data: [CategoryEntity])
    func onFailure(_ error: Error)
    func onIntenetFailure(_ error: String)
}

// MARK: - Protocols for response api calls
protocol APIClientProtocol: AnyObject {
  func getAllCategoriesList(url: APIServiceUrls, siteId : APIProductSiteId)
}


// MARK: - Call to api services from Mercado libre
class APIClient: APIClientProtocol {

// MARK: - Protocols to responses
    var categoriesDelegate: APICategoriesResponseProtocol?
    
    init() {}
        
//  Api call to all categories
    func getAllCategoriesList(url: APIServiceUrls, siteId: APIProductSiteId) {
        if(ConnectivityToIntenet.isConnectedToInternet){
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
        } else {
            self.categoriesDelegate?.onIntenetFailure(TextResources.noInternet.rawValue)
        }
    }
    
    // check connection to internet
    class ConnectivityToIntenet {
      class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
      }
    }
}
