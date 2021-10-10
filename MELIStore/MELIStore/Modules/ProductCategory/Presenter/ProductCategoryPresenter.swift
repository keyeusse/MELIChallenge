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
        interactor?.getNumberOfItemsAt(index) ?? 5
    }
    
    func getItemAtCategory() -> CategoryDetail? {
        interactor?.getItemCategoryAt()
    }
    
    func loadCategoriesData() {
        interactor?.loadCategoriesData()
    }
    
    func loadCategoryData(name : String) {
        interactor?.loadCategoryData(name: name)
    }
    
    func getProductData() -> Products? {
        interactor?.getItemProductsAt()
    }
    
    func showProductListView(for categoryId: String, from view: UIViewController) {
        router?.presentProductsView(for: categoryId, from: view)
    }

    func showProductDetailView(for product: Product, from view: UIViewController) {
        router?.showProductDetailView(for: product, from: view)
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
