//
//  APIClientProductDescriptionMock.swift
//  MELIStoreTests
//
//  Created by Meli on 10/11/21.
//

import Foundation
@testable import MELIStore


class APIClientProductDescriptionMock {
    var delegateDescription : APIProductDescriptionResponseProtocol?
}

extension APIClientProductDescriptionMock: APIClientProductDescriptionProtocol {
    
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

    func getProductDetailDescription(url: APIServiceUrls, productId: String) {
        let productDetail = ProductDetailDescription()
        
        //Get product description object for testing api call
        func getProductDescriptionForTest(fromJSONFile fileName: String) -> ProductDetailDescription? {
            let data = getJsonData(fromJSONFile: fileName) ?? Data()
            //Parsing Data
            let productDetail: ProductDetailDescription
            do {
                productDetail = try JSONDecoder().decode(ProductDetailDescription.self, from: data)
            } catch {
                return nil
            }
            
            return productDetail
        }
        
        self.delegateDescription?.getproductDescription(data: getProductDescriptionForTest(fromJSONFile: "ProductDescription") ?? productDetail)
    }

}

