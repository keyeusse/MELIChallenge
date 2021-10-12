//
//  APIClientMock.swift
//  MELIStoreTests
//
//  Created by Meli on 10/10/21.
//

import Foundation
@testable import MELIStore


class APIClientMock {
    var delegateCategories: APICategoriesResponseProtocol?
}

extension APIClientMock: APIClientProtocol {
    
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
    
    
    func getAllCategoriesList(url: APIServiceUrls, siteId: APIProductSiteId) {
        let categories = [CategoryEntity]()
        
        //Get Categories object for testing api call
        func getCategoriesForTest(fromJSONFile fileName: String) -> [CategoryEntity]? {
            let data = getJsonData(fromJSONFile: fileName) ?? Data()
            //Parsing Data
            let categories: [CategoryEntity]
            do {
                categories = try JSONDecoder().decode([CategoryEntity].self, from: data)
            } catch {
                return nil
            }
            
            return categories
        }
        
        self.delegateCategories?.getCategoriesResult(data: getCategoriesForTest(fromJSONFile: "Categories") ?? categories)
    }
}
