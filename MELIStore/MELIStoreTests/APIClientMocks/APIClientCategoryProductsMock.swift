//
//  APIClientCategoryProductsMock.swift
//  MELIStoreTests
//
//  Created by Meli on 10/11/21.
//

import Foundation
@testable import MELIStore


class APIClientCategoryProductsMock {
    var delegateProductsByCategory : APIProductsByCategoryResponseProtocol?
}

extension APIClientCategoryProductsMock: APIClientCategoryProductsProtocol {
    
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
    
    
    func getProductsByCategoryList(url: APIServiceUrls, idCategory: String, siteId: APIProductSiteId) {
        let products = Products()
        
        //Get category object for testing api call
        func getProducstForTest(fromJSONFile fileName: String) -> Products? {
            let data = getJsonData(fromJSONFile: fileName) ?? Data()
            //Parsing Data
            let products: Products
            do {
                products = try JSONDecoder().decode(Products.self, from: data)
            } catch {
                return nil
            }
            
            return products
        }
        self.delegateProductsByCategory?.getProductsByCategoryResult(data: getProducstForTest(fromJSONFile: "ProductsByCategory") ?? products)
    }

}

