//
//  APIClientCategory.swift
//  MELIStore
//
//  Created by Meli on 10/11/21.
//

import Foundation
import Alamofire


// MARK: - Protocols for call api to use category response
protocol APICategoryResponseProtocol {
    func getCategoryResult(data: CategoryDetail)
    func onFailure(_ error: Error)
    func onIntenetFailure(_ error: String)
}

// MARK: - Protocols for response api calls
protocol APIClientCategoryProtocol: AnyObject {
    func getCategoryList(url: APIServiceUrls, idCategory : String)
}


// MARK: - Call to api services from Mercado libre
class APIClientCategory: APIClientCategoryProtocol {

// MARK: - Protocols to responses
    var categoryDelegate: APICategoryResponseProtocol?
    
    init() {}
        
    
//    Api call to load ifo about categories
    func getCategoryList(url: APIServiceUrls, idCategory: String) {
        if(ConnectivityToIntenet.isConnectedToInternet){
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
        } else {
            self.categoryDelegate?.onIntenetFailure(TextResources.noInternet.rawValue)
        }
    }
    

    // check connection to internet
    class ConnectivityToIntenet {
      class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
      }
    }
}

