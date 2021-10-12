//
//  ProductDescriptionTest.swift
//  MELIStoreTests
//
//  Created by Meli on 10/11/21.
//

import Foundation
import XCTest
@testable import MELIStore

class ProductDescriptionTests: XCTestCase {
    private var apiClient: APIClientProductDescriptionMock?
    
    override func setUp() {
      self.apiClient = APIClientProductDescriptionMock()
        self.apiClient?.delegateDescription = self
        
    }
    
    override func tearDown() {
      self.apiClient = nil
    }
    

    func testGetProductDescription() {
        apiClient?.getProductDetailDescription(url: .productDescription, productId: "MCO558134948")
    }
    
}

extension ProductDescriptionTests: APIProductDescriptionResponseProtocol {
    func getproductDescription(data: ProductDetailDescription) {
        XCTAssertNotNil(data.plainText, "Tiene algo")
    }
    
    func onFailure(_ error: Error) {
        
    }
    
    func onIntenetFailure(_ error: String) {
        
    }
    
  }


