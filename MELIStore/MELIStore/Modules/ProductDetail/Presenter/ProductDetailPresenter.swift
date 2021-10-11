//
//  ProductDetailPresenter.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit

//VIPER PRESENTER
class ProductDetailPresenter: ProductDetailPresenterProtocol {
    
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
    
    func getNumberOfItemsAt(_ index: Int) -> Int {
        return 0
    }
}

// MARK: - RECEIVED FROM INTERACTOR
extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {
   
    func updateDescriptionData() {
        view?.loadProductDescription()
    }
    
    func receivedError(_ error: Error) {
        view?.showErrorMessage(error.localizedDescription)
    }
    
    func noInternetErrorMessage(_ message: String) {
        view?.showNoInternetErrorMessage(message)
    }
}
