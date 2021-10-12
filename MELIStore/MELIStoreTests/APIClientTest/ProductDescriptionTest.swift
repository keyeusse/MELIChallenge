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
    let noInternet = TextResources.noInternet.rawValue
    
    override func setUp() {
      self.apiClient = APIClientProductDescriptionMock()
        self.apiClient?.delegateDescription = self
        
    }
    
    override func tearDown() {
      self.apiClient = nil
    }
    

    func testGetProductDescription() {
        apiClient?.getProductDetailDescription(url: .productDescription, productId: TextResourcesTest.productId.rawValue)
    }
    
    func testGetErrorURL() {
        self.apiClient?.getErrorNoInternet()
    }
    
}

extension ProductDescriptionTests: APIProductDescriptionResponseProtocol {
    func getproductDescription(data: ProductDetailDescription) {
        XCTAssertNotNil(data.plainText, TextResourcesTest.textPlain.rawValue)
    }
    
    func onFailure(_ error: Error) {
    }
    
    func onIntenetFailure(_ error: String) {
        XCTAssertEqual(error, noInternet)
    }
    
  }


