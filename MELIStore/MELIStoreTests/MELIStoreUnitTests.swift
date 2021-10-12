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
    
    override func setUp() {
      self.apiClient = APIClientMock()
        self.apiClient?.delegateCategories = self
        
    }
    
    override func tearDown() {
      self.apiClient = nil
    }
    
    func testGetCategoriesList() {
        self.apiClient?.getAllCategoriesList(url: .categoriesAll, siteId: .mexico)
    }
    
//    func testGetCategory() {
//        self.apiClient?.getCategoryList(url: .categoryInfo, idCategory: "MCO441917")
//    }
//
//    func testGetProductCategoryList() {
//        self.apiClient?.getProductsByCategoryList(url: .categoryProducts, idCategory: "MCO441917", siteId: .mexico)
//    }
//
//    func testGetProduct() {
//    }
//
//    func testGetProductSearchList() {
//    }
//
//    func testGetProductDescription() {
//    }
    
}

extension CategoriesTests: APICategoriesResponseProtocol {
    func getCategoriesResult(data: [CategoryEntity]) {
//        funciona bien
    }
    
    func onFailure(_ error: Error) {
        
    }
    
    func onIntenetFailure(_ error: String) {
        
    }
    
  }

