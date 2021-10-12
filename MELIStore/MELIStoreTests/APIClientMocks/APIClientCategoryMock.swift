//
//  APIClientCategoryMock.swift
//  MELIStoreTests
//
//  Created by Meli on 10/11/21.
//

import Foundation
@testable import MELIStore


class APIClientCategoryMock {
    var delegateCategory : APICategoryResponseProtocol?
}

extension APIClientCategoryMock: APIClientCategoryProtocol {
    
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
    
    //    Mock for getting category detail from api
    func getCategoryList(url: APIServiceUrls, idCategory: String) {
        
        let category = CategoryDetail()
        
        //Get category object for testing api call
        func getCategoryForTest(fromJSONFile fileName: String) -> CategoryDetail? {
            let data = getJsonData(fromJSONFile: fileName) ?? Data()
            //Parsing Data
            let category: CategoryDetail
            do {
                category = try JSONDecoder().decode(CategoryDetail.self, from: data)
            } catch {
                return nil
            }
            
            return category
        }
        self.delegateCategory?.getCategoryResult(data: getCategoryForTest(fromJSONFile: "Category") ?? category)
    }
    
    //    Mock for no internet getting category from api
    func getErrorNoInternet() {
        self.delegateCategory?.onIntenetFailure(TextResources.noInternet.rawValue)
    }

}

