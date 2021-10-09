//
//  ProductDetailPresenter.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit

class ProductDetailPresenter: ProductDetailPresenterProtocol {
    
    var view: ProductDetailViewProtocol?
    var interactor: ProductDetailInteractorInputProtocol?
    var router: ProductDetailRouterProtocol?
    

    func loadProductDetailData(productId: String) {
        interactor?.loadProductDetailData(productId: productId)
    }
    
    func produtDetail(productId: String) -> ProductDetailDescription {
        (interactor?.getProductDetail())!
    }
}

// MARK: - RECEIVED FROM INTERACTOR
extension ProductsPresenter: ProductDetailInteractorOutputProtocol {
    func updateProductDetailData() {
        view?.loadProductList()
    }
    
    
    
//    func updateProductData() {
//        view?.loadProductList()
//    }
//
//    func receivedError(_ error: Error) {
//    }
}
