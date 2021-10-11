//
//  ProductDetailRouter.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import Foundation
import UIKit

//VIPER ROUTER: to navegatio between VC
class ProductDetailRouter: ProductDetailRouterProtocol {
    
    func presentProductDescriptionView(for product: ProductDetailDescription, from view: UIViewController) {
    }
    
  typealias ProductDetailPresenterProtocols = ProductDetailPresenterProtocol & ProductDetailInteractorOutputProtocol
  
    class func createProductDetailModule(for view: ProductDetailViewController) {
        let presenter: ProductDetailPresenterProtocols = ProductDetailPresenter()
        view.presenter = presenter
        view.presenter?.router = ProductDetailRouter()
        view.presenter?.view = view
        view.presenter?.interactor = ProductDetailInteractor()
        view.presenter?.interactor?.presenter = presenter
    }
}
