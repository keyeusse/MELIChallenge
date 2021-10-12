//
//  ProductTest.swift
//  MELIStoreTests
//
//  Created by Meli on 10/11/21.
//

import Foundation
import XCTest
@testable import MELIStore

class ProductTests: XCTestCase {
    private var apiClient: APIClientProductMock?
    
    override func setUp() {
      self.apiClient = APIClientProductMock()
        self.apiClient?.delegateProduct = self
        
    }
    
    override func tearDown() {
      self.apiClient = nil
    }
    
    
//    func testGetCategory() {
//        self.apiClient?.getCategoryList(url: .categoryInfo, idCategory: "MCO441917")
//    }
//
//    func testGetProductCategoryList() {
//        self.apiClient?.getProductsByCategoryList(url: .categoryProducts, idCategory: "MCO441917", siteId: .mexico)
//    }
//
    func testGetProduct() {
        apiClient?.getProductDetail(url: .product, idProduct: "MCO657478327")
    }
//
//    func testGetProductSearchList() {
//    }
//
//    func testGetProductDescription() {
//    }
    
}

extension ProductTests: APIProductResponseProtocol {
    func getProductResult(data: Product) {
//        funciona bien
    }
    
    
    func onFailure(_ error: Error) {
        
    }
    
    func onIntenetFailure(_ error: String) {
        
    }
    
  }


