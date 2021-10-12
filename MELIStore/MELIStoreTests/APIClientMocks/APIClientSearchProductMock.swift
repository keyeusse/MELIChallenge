//
//  APIClientSearchProductMock.swift
//  MELIStore
//
//  Created by Meli on 10/11/21.
//

import Foundation
@testable import MELIStore


class APIClientSearchProductsMock {
    var delegateSearchProduct : APISearchProductsResponseProtocol?
}

extension APIClientSearchProductsMock: APIClientSearchProductsProtocol {
    
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
    
    func getProductsSearchList(url: APIServiceUrls, categoryName: String, siteId: APIProductSiteId) {
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
        self.delegateSearchProduct?.getproductSearchResult(data: getProducstForTest(fromJSONFile: "ProductsByCategoryName") ?? products)
    }
    
    func getErrorNoInternet() {
        self.delegateSearchProduct?.onIntenetFailure(TextResources.noInternet.rawValue)
    }

}
