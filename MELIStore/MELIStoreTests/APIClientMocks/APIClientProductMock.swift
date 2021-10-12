//
//  APIClientProductMock.swift
//  MELIStoreTests
//
//  Created by Meli on 10/11/21.
//

import Foundation
@testable import MELIStore


class APIClientProductMock {
    var delegateProduct : APIProductResponseProtocol?
}

extension APIClientProductMock: APIClientProductProtocol {
    
    //get data test from json files
    func getJsonData(fromJSONFile fileName: String) -> Data? {
        do {
                if let filePath = Bundle.main.path(forResource: fileName, ofType: "json") {
                    let fileUrl = URL(fileURLWithPath: filePath)
                    let data = try Data(contentsOf: fileUrl)
                    return data
                }
            } catch {
                print("error: \(error)")
            }
            return nil
    }

    
    func getProductDetail(url: APIServiceUrls, idProduct: String) {
        let product = Product()
        
        //Get product object for testing api call
        func getProductForTest(fromJSONFile fileName: String) -> Product? {
            let data = getJsonData(fromJSONFile: fileName) ?? Data()
            //Parsing Data
            let product: Product
            do {
                product = try JSONDecoder().decode(Product.self, from: data)
            } catch {
                return nil
            }
            
            return product
        }
        self.delegateProduct?.getProductResult(data: getProductForTest(fromJSONFile: "Product") ?? product)
    }
    
    func getErrorNoInternet() {
        self.delegateProduct?.onIntenetFailure(TextResources.noInternet.rawValue)
    }

}

