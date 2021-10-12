//
//  APIClientProduct.swift
//  MELIStore
//
//  Created by Meli on 10/11/21.
//

import Foundation
import Alamofire

// MARK: - Protocols for call api to use product response
protocol APIProductResponseProtocol {
    func getProductResult(data: Product)
    func onFailure(_ error: Error)
    func onIntenetFailure(_ error: String)
}

// MARK: - Protocols for response api calls
protocol APIClientProductProtocol: AnyObject {
    func getProductDetail(url: APIServiceUrls, idProduct : String)
}


// MARK: - Call to api services from Mercado libre
class APIClientProduct: APIClientProductProtocol {

// MARK: - Protocols to responses
    var productDelegate: APIProductResponseProtocol?
    
    init() {}
        

//  Api call to load product detail by id
    func getProductDetail(url: APIServiceUrls, idProduct: String) {
        if(ConnectivityToIntenet2.isConnectedToInternet){
            let fullPathURL = url.rawValue + idProduct

            AF.request(fullPathURL).validate().responseDecodable(of: Product.self) { (response) in
                switch response.result {
                case .success(let results):
                    self.productDelegate?.getProductResult(data: results)
                case .failure(let error):
                  self.productDelegate?.onFailure(error)
                }
            }
        } else {
            self.productDelegate?.onIntenetFailure(TextResources.noInternet.rawValue)
        }
    }
    
    // check connection to internet
    class ConnectivityToIntenet2 {
      class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
      }
    }
}
