//
//  CategoryProductsTest.swift
//  MELIStoreTests
//
//  Created by Meli on 10/11/21.
//

import Foundation
import XCTest
@testable import MELIStore

class CategoryProductsTests: XCTestCase {
    private var apiClient: APIClientCategoryProductsMock?
    
    override func setUp() {
      self.apiClient = APIClientCategoryProductsMock()
        self.apiClient?.delegateProductsByCategory = self
        
    }
    
    override func tearDown() {
      self.apiClient = nil
    }
    
//    func testGetCategoriesList() {
//        self.apiClient?.getAllCategoriesList(url: .categoriesAll, siteId: .mexico)
//    }
    
//    func testGetCategory() {
//        self.apiClient?.getCategoryList(url: .categoryInfo, idCategory: "MCO441917")
//    }
//
    func testGetProductCategoryList() {
        self.apiClient?.getProductsByCategoryList(url: .categoryProducts, idCategory: "MCO441917", siteId: .mexico)
    }
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

extension CategoryProductsTests: APIProductsByCategoryResponseProtocol {
    
    func getProductsByCategoryResult(data: Products) {
//        Funciona bien
    }
    
    
    func onFailure(_ error: Error) {
        
    }
    
    func onIntenetFailure(_ error: String) {
        
    }
  }

