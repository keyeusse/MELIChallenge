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
    
    override func setUp() {
      self.apiClient = APIClientCategoryMock()
        self.apiClient?.delegateCategory = self
        
    }
    
    override func tearDown() {
      self.apiClient = nil
    }
    
    
    func testGetCategory() {
        self.apiClient?.getCategoryList(url: .categoryInfo, idCategory: "MCO441917")
    }
    
}


extension CategoryTests: APICategoryResponseProtocol {
    
    func onFailure(_ error: Error) {
        
    }
    
    func onIntenetFailure(_ error: String) {
        
    }
    
    func getCategoryResult(data: CategoryDetail) {
        print(data)
    }
  }

