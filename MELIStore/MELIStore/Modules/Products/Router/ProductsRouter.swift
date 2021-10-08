//
//  ProductsRouter.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit

//Class to navegatio between VC
class ProductsRouter: ProductsRouterProtocol {
    
    func presentProductDetailView(for product: Product, from view: UIViewController) {
        
    }
    
    
  typealias ProductsPresenterProtocols = ProductsPresenterProtocol & ProductsInteractorOutputProtocol
  
    class func createProductsModule(for view: ProductViewController, and categoryId: String) {
        let presenter: ProductsPresenterProtocols = ProductsPresenter()
        view.presenter = presenter
        view.presenter?.router = ProductsRouter()
        view.presenter?.view = view
        view.presenter?.interactor = ProductsInteractor()
        view.presenter?.interactor?.presenter = presenter
    }
    
}

