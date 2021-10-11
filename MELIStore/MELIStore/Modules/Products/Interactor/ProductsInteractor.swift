//
//  ProductsInteractor.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit

class ProductsInteractor: ProductsInteractorInputProtocol {
    

    weak var presenter: ProductsInteractorOutputProtocol?
    private let apiClient = APIClient()
    private var productsResult: Products?
    private var productsSearchResult: Products?
    
    func getNumberOfItemsAt(_ index: Int) -> Int {
        return productsResult?.result.count ?? 0
    }
    
    func loadProductsData(categoryId : String) {
        apiClient.productsByCategoryDelegate = self
        apiClient.getProductsByCategoryList(url: .categoryProducts, idCategory: categoryId, siteId: .mexico)
    }
    
    func getItemAt(indexPath: IndexPath) -> Products? {
        return productsResult
    }
    
    func getProductsSearchItemAt() -> Products? {
        return productsSearchResult
    }
    
    func getProductItemAt() -> Products? {
        return productsResult
    }
    
    func getNumberOfSearchedItemsAt(_ index: Int) -> Int {
        return productsResult?.result.count ?? 0
    }
    
    func loadSearchedProductsData(name: String) {
        apiClient.productSearchDelegate = self
        apiClient.getProductsSearchList(url: .productNameSearch, categoryName: name, siteId: .mexico)
    }
}

//API Calls for all products
extension ProductsInteractor: APIProductsByCategoryResponseProtocol {
    func getProductsByCategoryResult(data: Products) {
        self.productsResult = data
        self.presenter?.updateProductData()
    }
    
  // Manage error response
  func onFailure(_ error: Error) {
    presenter?.receivedError(error)
  }
}

//API Calls for searched products
extension ProductsInteractor: APISearchProductsResponseProtocol {
    func getproductSearchResult(data: Products) {
        self.productsSearchResult = data
        self.presenter?.updateProductData()
    }
}

