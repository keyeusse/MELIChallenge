//
//  ProductsProtocol.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit

// MARK: - VIPER Protocols
protocol ProductsViewProtocol: AnyObject {
  var presenter: ProductsPresenterProtocol? { get set}
  // PRESENTER -> VIEW
  func loadProductList()
  func showErrorMessage(_ message: String)
}

protocol ProductsPresenterProtocol: AnyObject {
  var view: ProductsViewProtocol? { get set }
  var interactor: ProductsInteractorInputProtocol? { get set}
  var router: ProductsRouterProtocol? { get set }
    
  // VIEW -> PRESENTER
  func getItemAtProducts() -> Products?
  func getNumberOfItemsAt(_ index: Int) -> Int
    func loadProdutsData(categoryId : String)
    
  // Show Product Detail Views
    func showProducDetailView(for product: Product, from view: UIViewController)
}

protocol ProductsInteractorInputProtocol: AnyObject {
  var presenter: ProductsInteractorOutputProtocol? { get set}

  // PRESENTER -> INTERACTOR
    func loadProductsData(categoryId : String)
  func getNumberOfItemsAt(_ index: Int) -> Int
  func getProductItemAt() -> Products?
    
}

protocol ProductsInteractorOutputProtocol: AnyObject {
  // INTERACTOR -> PRESENTER
  func updateProductData()
  func receivedError(_ error: Error)
}

protocol ProductsRouterProtocol: AnyObject {
  // PRESENTER -> ROUTER
  func presentProductDetailView(for product: Product, from view: UIViewController)
}
