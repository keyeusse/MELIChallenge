//
//  MELIStoreUnitTests.swift
//  MELIStoreTests
//
//  Created by Meli on 10/11/21.
//

import Foundation
import XCTest
@testable import MELIStore

class CategoriesTests: XCTestCase {
    private var apiClient: APIClientMock?
    
    let expectedName = TextResourcesTest.expectedCategoryName.rawValue
    let noInternet = TextResources.noInternet.rawValue
    
    override func setUp() {
      self.apiClient = APIClientMock()
        self.apiClient?.delegateCategories = self
        
    }
    
    override func tearDown() {
      self.apiClient = nil
    }
    
    func testGetCategoriesListSuccessfuly() {
        self.apiClient?.getAllCategoriesList(url: .categoriesAll, siteId: .mexico)
    }
    
    func testGetErrorWhenNoIntenetConecction() {
        self.apiClient?.getErrorNoInternet()
    }
}

extension CategoriesTests: APICategoriesResponseProtocol {
    
//    Delegates for responses
    func getCategoriesResult(data: [CategoryEntity]) {
        XCTAssertEqual(data[1].name, expectedName)
    }
    
    func onFailure(_ error: Error) {
    }
    
    func onIntenetFailure(_ error: String) {
        XCTAssertEqual(error, noInternet)
    }
    
  }

