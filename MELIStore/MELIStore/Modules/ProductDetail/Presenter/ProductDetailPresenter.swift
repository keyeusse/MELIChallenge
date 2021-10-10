//
//  ProductDetailPresenter.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit

class ProductDetailPresenter: ProductDetailPresenterProtocol {
    func getNumberOfItemsAt(_ index: Int) -> Int {
        return 0
    }
    
    
    var view: ProductDetailViewProtocol?
    var interactor: ProductDetailInteractorInputProtocol?
    var router: ProductDetailRouterProtocol?
    
    func getProductDescription() -> ProductDetailDescription? {
        interactor?.getProductDescription()
    }
    
    func loadDescriptionData(categoryId: String) {
        interactor?.loadDescriptionData(categoryId: categoryId)
    }
    
    func showProductDescriptionView(for product: Product, from view: UIViewController) {
        
    }
    
    
//    func showProducDetailView(for product: Product, from view: UIViewController) {
//       router?.presentProductDetailView(for: product, from: view)
//    }
}

// MARK: - RECEIVED FROM INTERACTOR
extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {
    func updateDescriptionData() {
        view?.loadProductDescription()
    }
    
    func receivedError(_ error: Error) {
    }
}
