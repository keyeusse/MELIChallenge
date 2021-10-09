//
//  ProductCategoryRouter.swift
//  MELIStore
//
//  Created by Meli on 10/7/21.
//

import UIKit

//Class to navegatio between VC
class ProductCategoryRouter: ProductCategoryRouterProtocol {
    
    func presentProductsView(for categoryId: String, from view: UIViewController) {
        guard let productListView = view.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController else { return }
        productListView.categoryId = categoryId
        ProductsRouter.createProductsModule(for: productListView, and: categoryId)
           view.navigationController?.pushViewController(productListView, animated: true)
    }
    
  
  typealias ProductCategoryPresenterProtocols = ProductCategoryPresenterProtocol & ProductCategoryInteractorOutputProtocol
  
  class func createModule(view: ViewController) {
    let presenter: ProductCategoryPresenterProtocols = ProductCategoryPresenter()
    view.presenter = presenter
    view.presenter?.router = ProductCategoryRouter()
    view.presenter?.view = view
    view.presenter?.interactor = ProductCategoryInteractor()
    view.presenter?.interactor?.presenter = presenter
  }
}
