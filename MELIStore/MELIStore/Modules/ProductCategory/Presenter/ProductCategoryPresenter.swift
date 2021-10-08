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
    
    func loadCategoriesData() {
        interactor?.loadCategoriesData()
    }
    
    func showCategoriesView(for products: Products, from view: UIViewController) {
        router?.presentProductsView(for: products, from: view)
    }

}

// MARK: - RECEIVED FROM INTERACTOR
extension ProductCategoryPresenter: ProductCategoryInteractorOutputProtocol {
    
    func updateData() {
        view?.loadCategories()
    }
    
    func receivedError(_ error: Error) {
    }
}
