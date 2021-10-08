//
//  ProductsPresenter.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit

class ProductsPresenter: ProductsPresenterProtocol {
    var view: ProductsViewProtocol?
    var interactor: ProductsInteractorInputProtocol?
    var router: ProductsRouterProtocol?
    
    func getItemAtProducts() -> Products? {
        interactor?.getProductItemAt()
    }
    
    func getNumberOfItemsAt(_ index: Int) -> Int {
        interactor?.getNumberOfItemsAt(index) ?? 0
    }
    
    func loadProdutsData(categoryId : String) {
        interactor?.loadProductsData(categoryId: categoryId)
    }
    
    func showProducDetailView(for product: Product, from view: UIViewController) {
//        router?.presentProductDetailView(for: Product, from: view)
    }
    
    
    
//    func getItemAt(indexPath: IndexPath) -> CategoryEntity? {
//        interactor?.getItemAt(indexPath)
//    }
//
//    func getNumberOfItemsAt(_ index: Int) -> Int {
//        interactor?.getNumberOfItemsAt(index) ?? 0
//    }
//
//    func getItemAtCategory() -> CategoryDetail? {
//        interactor?.getItemCategoryAt()
//    }
//
//    func loadCategoriesData() {
//        interactor?.loadCategoriesData()
//    }
//
//    func loadCategoryData(id: String) {
//        interactor?.loadCategoryData(id: id)
//    }
//
//    func showProductListView(for categoryId: String, from view: UIViewController) {
//        router?.presentProductsView(for: categoryId, from: view)
//    }

}

// MARK: - RECEIVED FROM INTERACTOR
extension ProductsPresenter: ProductsInteractorOutputProtocol {
    
    func updateProductData() {
        
    }
    
    
//    func updateCategoryData() {
//        view?.loadCategory()
//    }
//
//    func updateData() {
//        view?.loadCategories()
//    }
    
    func receivedError(_ error: Error) {
    }
}

