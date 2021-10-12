//
//  ProductCategoryInteractor.swift
//  MELIStore
//
//  Created by Meli on 10/7/21.
//

import UIKit

//VIPER Interactor is util for business logic
class ProductCategoryInteractor: ProductCategoryInteractorInputProtocol {
    
    weak var presenter: ProductCategoryInteractorOutputProtocol?
    private let apiClient = APIClient()
    private let apiClientCategory = APIClientSearchProducts()
    private var categoriesResults: [CategoryEntity]?
    private var categoryResults: CategoryDetail?
    private var productsResult: Products?
    
    
    func getItemAt(_ indexPath: IndexPath) -> CategoryEntity? {
        return categoriesResults?[indexPath.row]
    }
    
    func loadCategoriesData() {
        apiClient.categoriesDelegate = self
        apiClient.getAllCategoriesList(url: .categoriesAll, siteId: .mexico)
    }
    
    func loadCategoryData(name: String) {
        apiClientCategory.productSearchDelegate = self
        apiClientCategory.getProductsSearchList(url: .productNameSearch, categoryName: name, siteId: .mexico)
    }
    
    func getNumberOfItemsAt(_ index: Int) -> Int {
        return categoriesResults?.count ?? 0
    }
    
    func getItemCategoryAt() -> CategoryDetail? {
        return categoryResults
    }

    func getItemProductsAt() -> Products? {
        return productsResult
    }
    
    func getNumberOfSearchedItemsAt(_ index: Int) -> Int {
        return productsResult?.results.count ?? 0
    }
}

//API Calls for all categories
extension ProductCategoryInteractor: APICategoriesResponseProtocol {
    func onIntenetFailure(_ error: String) {
        presenter?.noInternetError(error)
    }
    
    func getCategoriesResult(data: [CategoryEntity]) {
        self.categoriesResults = data
        self.presenter?.updateData()
    }
    
  
  // Manage error response
  func onFailure(_ error: Error) {
    presenter?.receivedError(error)
  }
}

//API Calls for searched products
extension ProductCategoryInteractor: APISearchProductsResponseProtocol {
    func getproductSearchResult(data: Products) {
        self.productsResult = data
        self.presenter?.updateCategoryData()
    }
    
    func getCategoryResult(data: CategoryDetail) {
        self.categoryResults = data
        self.presenter?.updateCategoryData()
    }
}

