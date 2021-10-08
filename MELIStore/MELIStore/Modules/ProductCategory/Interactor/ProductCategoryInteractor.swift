//
//  ProductCategoryInteractor.swift
//  MELIStore
//
//  Created by Meli on 10/7/21.
//

import UIKit

class ProductCategoryInteractor: ProductCategoryInteractorInputProtocol {
    
    weak var presenter: ProductCategoryInteractorOutputProtocol?
    private let apiClient = APIClient()
    private var categoriesResults: [CategoryEntity]?
    private var categoryResults: CategoryDetail?
    
    
    func getItemAt(_ indexPath: IndexPath) -> CategoryEntity? {
        return categoriesResults?[indexPath.row]
    }
    
    func loadCategoriesData() {
        apiClient.categoriesDelegate = self
        apiClient.getAllCategoriesList(url: .categoriesAll, siteId: .mexico)
    }
    
    func loadCategoryData(id: String) {
        apiClient.categoryDelegate = self
        apiClient.getCategoryList(url: .categoryInfo, idCategory: id)
    }
    
    func getNumberOfItemsAt(_ index: Int) -> Int {
        return categoriesResults?.count ?? 0
    }
    
    func getItemCategoryAt() -> CategoryDetail? {
        return categoryResults
    }

}

//API Calls for all categories
extension ProductCategoryInteractor: APICategoriesResponseProtocol {
    func getCategoriesResult(data: [CategoryEntity]) {
        self.categoriesResults = data
        self.presenter?.updateData()
    }
    
  
  // Manage error response
  func onFailure(_ error: Error) {
    presenter?.receivedError(error)
  }
}

//API Calls for all categories
extension ProductCategoryInteractor: APICategoryResponseProtocol {
    func getCategoryResult(data: CategoryDetail) {
        self.categoryResults = data
        self.presenter?.updateCategoryData()
    }
}

