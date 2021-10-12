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
    
    let expectedProductName = TextResourcesTest.expectedProductName.rawValue
    let noInternet = TextResources.noInternet.rawValue
    
    override func setUp() {
      self.apiClient = APIClientProductMock()
        self.apiClient?.delegateProduct = self
        
    }
    
    override func tearDown() {
      self.apiClient = nil
    }
    
    func testGetProductSuccessfully() {
        apiClient?.getProductDetail(url: .product, idProduct: TextResourcesTest.idProduct.rawValue)
    }
    
    func testGetErrorWhenNoInternet() {
        self.apiClient?.getErrorNoInternet()
    }
}

extension ProductTests: APIProductResponseProtocol {
//    Delegates for responses
    func getProductResult(data: Product) {
        XCTAssertEqual(data.title, expectedProductName)
    }
    
    func onFailure(_ error: Error) {
    }
    
    func onIntenetFailure(_ error: String) {
        XCTAssertEqual(error, noInternet)
    }
    
  }


