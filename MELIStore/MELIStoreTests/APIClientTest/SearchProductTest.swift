//
//  SearchProductTest.swift
//  MELIStoreTests
//
//  Created by Meli on 10/11/21.
//

import Foundation
import XCTest
@testable import MELIStore

class SearchProductsTests: XCTestCase {
    private var apiClient: APIClientSearchProductsMock?
    
    let expectedCategoryName = TextResourcesTest.expectedSearchedCategoryName.rawValue
    let noInternet = TextResources.noInternet.rawValue
    
    override func setUp() {
      self.apiClient = APIClientSearchProductsMock()
        self.apiClient?.delegateSearchProduct = self
        
    }
    
    override func tearDown() {
      self.apiClient = nil
    }
    
    func testGetProductSearchList() {
        apiClient?.getProductsSearchList(url: .productNameSearch, categoryName: TextResourcesTest.expectedSearchedCategoryName.rawValue, siteId: .mexico)
    }
    
    func testGetErrorURL() {
        self.apiClient?.getErrorNoInternet()
    }
    
}

extension SearchProductsTests: APISearchProductsResponseProtocol {
    func getproductSearchResult(data: Products) {
        XCTAssertEqual(data.query, expectedCategoryName)
    }
    
    func onFailure(_ error: Error) {
    }
    
    func onIntenetFailure(_ error: String) {
        XCTAssertEqual(error, noInternet)
    }
    
  }

