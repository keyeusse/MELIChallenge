//
//  APIClientProductDescription.swift
//  MELIStore
//
//  Created by Meli on 10/11/21.
//

import Foundation
import Alamofire


// MARK: - Protocols for call api to use description product response
protocol APIProductDescriptionResponseProtocol {
    func getproductDescription(data: ProductDetailDescription)
    func onFailure(_ error: Error)
    func onIntenetFailure(_ error: String)
}

// MARK: - Protocols for response api calls
protocol APIClientProductDescriptionProtocol: AnyObject {
    func getProductDetailDescription(url: APIServiceUrls, productId : String)
}


// MARK: - Call to api services from Mercado libre
class APIClientProductDescription: APIClientProductDescriptionProtocol {

// MARK: - Protocols to responses
    var productDescriptionDelegate: APIProductDescriptionResponseProtocol?
    
    init() {}

//    Api call for product description
    func getProductDetailDescription(url: APIServiceUrls, productId: String) {
        if(ConnectivityToIntenet.isConnectedToInternet){
            let URL = url.rawValue
            let replaceSite = URL.replacingOccurrences(of: "{idProduct}", with: productId)

            AF.request(replaceSite).validate().responseDecodable(of: ProductDetailDescription.self) { (response) in
                switch response.result {
                case .success(let results):
                    self.productDescriptionDelegate?.getproductDescription(data: results)
                case .failure(let error):
                  self.productDescriptionDelegate?.onFailure(error)
                }
            }
        } else {
            self.productDescriptionDelegate?.onIntenetFailure(TextResources.noInternet.rawValue)
        }
    }
    
    // check connection to internet
    class ConnectivityToIntenet {
      class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
      }
    }
}

