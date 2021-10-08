//
//  ProductCategoryPresenter.swift
//  MELIStore
//
//  Created by Meli on 10/7/21.
//

import UIKit

class ProductCategoryPresenter: ProductCategoryPresenterProtocol {
    
    // MARK: - VIPER
    weak var view: ProductCategoryViewProtocol?
    var interactor: ProductCategoryInteractorInputProtocol?
    var router: ProductCategoryRouterProtocol?
    
    func getItemAt(indexPath: IndexPath) -> CategoryEntity? {
        interactor?.getItemAt(indexPath)
    }
    
    func getNumberOfItemsAt(_ index: Int) -> Int {
        interactor?.getNumberOfItemsAt(index) ?? 0
    }
    
    func getItemAtCategory() -> CategoryDetail? {
        interactor?.getItemCategoryAt()
    }
    
    func loadCategoriesData() {
        interactor?.loadCategoriesData()
    }
    
    func loadCategoryData(id: String) {
        interactor?.loadCategoryData(id: id)
    }
    
    func showProductListView(for categoryId: String, from view: UIViewController) {
        router?.presentProductsView(for: categoryId, from: view)
    }

}

// MARK: - RECEIVED FROM INTERACTOR
extension ProductCategoryPresenter: ProductCategoryInteractorOutputProtocol {
    func updateCategoryData() {
        view?.loadCategory()
    }
    
    func updateData() {
        view?.loadCategories()
    }
    
    func receivedError(_ error: Error) {
    }
}
