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
    
    func loadProdutDetailData(productId: String) {
        
    }
    
//    var view: ProductsViewProtocol?
//    var interactor: ProductsInteractorInputProtocol?
//    var router: ProductsRouterProtocol?
//
//    func getItemAtProducts() -> Products? {
//        interactor?.getProductItemAt()
//    }
//
//    func getNumberOfItemsAt(_ index: Int) -> Int {
//        interactor?.getNumberOfItemsAt(index) ?? 0
//    }
//
//    func loadProdutsData(categoryId : String) {
//        interactor?.loadProductsData(categoryId: categoryId)
//    }
//
//    func showProducDetailView(for product: Product, from view: UIViewController) {
////        router?.presentProductDetailView(for: Product, from: view)
//    }
}

// MARK: - RECEIVED FROM INTERACTOR
extension ProductsPresenter: ProductDetailInteractorOutputProtocol {
    
//    func updateProductData() {
//        view?.loadProductList()
//    }
//
//    func receivedError(_ error: Error) {
//    }
}
