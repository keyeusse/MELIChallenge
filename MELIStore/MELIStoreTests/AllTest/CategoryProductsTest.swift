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
    
    let expectedProductName = "Hidrolavadora Black+decker Bw13 Con 1450psi De Presión Máxima 220v"
    let noInternet = TextResources.noInternet.rawValue
    
    override func setUp() {
      self.apiClient = APIClientCategoryProductsMock()
        self.apiClient?.delegateProductsByCategory = self
        
    }
    
    override func tearDown() {
      self.apiClient = nil
    }
    
    func testGetProductCategoryList() {
        self.apiClient?.getProductsByCategoryList(url: .categoryProducts, idCategory: "MCO441917", siteId: .mexico)
    }
    
    func testGetErrorURL() {
        self.apiClient?.getErrorNoInternet()
    }
}

extension CategoryProductsTests: APIProductsByCategoryResponseProtocol {
    
    func getProductsByCategoryResult(data: Products) {
        XCTAssertEqual(data.results[0].title, expectedProductName)
    }
    
    
    func onFailure(_ error: Error) {
        
    }
    
    func onIntenetFailure(_ error: String) {
        XCTAssertEqual(error, noInternet)
    }
  }

