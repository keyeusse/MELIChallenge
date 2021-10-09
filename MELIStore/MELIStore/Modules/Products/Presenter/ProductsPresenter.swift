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
        interactor?.getNumberOfItemsAt(index) ?? 5
    }
    
    func loadProdutsData(categoryId : String) {
        interactor?.loadProductsData(categoryId: categoryId)
    }
    
    func showProducDetailView(for product: Product, from view: UIViewController) {
       router?.presentProductDetailView(for: product, from: view)
    }
}

// MARK: - RECEIVED FROM INTERACTOR
extension ProductsPresenter: ProductsInteractorOutputProtocol {
    
    func updateProductData() {
        view?.loadProductList()
    }
    
    func receivedError(_ error: Error) {
    }
}

