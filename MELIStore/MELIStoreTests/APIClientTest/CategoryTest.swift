//
//  CategoryDetailTest.swift
//  MELIStoreTests
//
//  Created by Meli on 10/11/21.
//

import Foundation
import XCTest
@testable import MELIStore

class CategoryTests: XCTestCase {
    private var apiClient: APIClientCategoryMock?
    let expectedName = TextResourcesTest.expectedCategoryName.rawValue
    let noInternet = TextResources.noInternet.rawValue
    
    override func setUp() {
      self.apiClient = APIClientCategoryMock()
        self.apiClient?.delegateCategory = self
        
    }
    
    override func tearDown() {
      self.apiClient = nil
    }
    
    
    func testGetCategorySucessfully() {
        self.apiClient?.getCategoryList(url: .categoryInfo, idCategory: TextResourcesTest.idCategory.rawValue)
    }
    
    func testGetErrorWhenNoInternetConnection() {
        self.apiClient?.getErrorNoInternet()
    }
    
}


extension CategoryTests: APICategoryResponseProtocol {
    
//    Delegate for responses
    func onFailure(_ error: Error) {
    }
    
    func onIntenetFailure(_ error: String) {
        XCTAssertEqual(error, noInternet)
    }
    
    func getCategoryResult(data: CategoryDetail) {
        XCTAssertEqual(data.name, expectedName)
    }
  }

