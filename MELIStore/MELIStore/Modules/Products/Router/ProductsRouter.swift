//
//  ProductsRouter.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit

//// MARK: - VIPER ROUTER : to navegatio between VC
class ProductsRouter: ProductsRouterProtocol {
    
//    Go to product detail
    func presentProductDetailView(for product: Product, from view: UIViewController) {
        guard let detailProductListView = view.storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController else { return }
        detailProductListView.product = product
        view.navigationController?.pushViewController(detailProductListView, animated: true)
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

