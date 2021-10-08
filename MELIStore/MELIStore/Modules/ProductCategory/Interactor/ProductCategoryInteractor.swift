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
    
    
    func getItemAt(_ indexPath: IndexPath) -> CategoryEntity? {
        return categoriesResults?[indexPath.row]
    }
    
    func loadCategoriesData() {
        apiClient.categoriesDelegate = self
        apiClient.getAllCategoriesList(url: .categoriesAll, siteId: .mexico)
    }
    
    func getNumberOfItemsAt(_ index: Int) -> Int {
        return categoriesResults?.count ?? 0
    }

}

//API Calls for movies and series
extension ProductCategoryInteractor: APICategoriesResponseProtocol {
    func getCategoriesResult(data: [CategoryEntity]) {
        self.categoriesResults = data
        print(data)
        self.presenter?.updateData()
    }
    
  
  // Manage error response
  func onFailure(_ error: Error) {
    presenter?.receivedError(error)
  }
}

