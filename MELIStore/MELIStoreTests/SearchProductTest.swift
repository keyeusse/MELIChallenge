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
    
    override func setUp() {
      self.apiClient = APIClientSearchProductsMock()
        self.apiClient?.delegateSearchProduct = self
        
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
//    func testGetProductCategoryList() {
//        self.apiClient?.getProductsByCategoryList(url: .categoryProducts, idCategory: "MCO441917", siteId: .mexico)
//    }
//
//    func testGetProduct() {
//    }
//
    func testGetProductSearchList() {
        apip
        
    }
//
//    func testGetProductDescription() {
//    }
    
}

extension SearchProductsTests: APISearchProductsResponseProtocol {
    func getproductSearchResult(data: Products) {
        
    }
    
    func onFailure(_ error: Error) {
        
    }
    
    func onIntenetFailure(_ error: String) {
        
    }
    
  }

