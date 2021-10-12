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
    
    let expectedProductName = "Hidrolavadora Black+decker Bw13 Con 1450psi De Presión Máxima 220v"
    
    override func setUp() {
      self.apiClient = APIClientProductMock()
        self.apiClient?.delegateProduct = self
        
    }
    
    override func tearDown() {
      self.apiClient = nil
    }
    
    func testGetProduct() {
        apiClient?.getProductDetail(url: .product, idProduct: "MCO657478327")
    }
}

extension ProductTests: APIProductResponseProtocol {
    func getProductResult(data: Product) {
        XCTAssertEqual(data.title, expectedProductName)
    }
    
    
    func onFailure(_ error: Error) {
        
    }
    
    func onIntenetFailure(_ error: String) {
        
    }
    
  }


