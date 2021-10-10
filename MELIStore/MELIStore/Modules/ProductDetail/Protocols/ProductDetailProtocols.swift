//
//  Protocols.swift
//  MELIStore
//
//  Created by Meli on 10/8/21.
//

import UIKit

// MARK: - VIPER Protocols
protocol ProductDetailViewProtocol: AnyObject {
  var presenter: ProductDetailPresenterProtocol? { get set}
  // PRESENTER -> VIEW
  func loadProductDescription()
  func showErrorMessage(_ message: String)
}

protocol ProductDetailPresenterProtocol: AnyObject {
  var view: ProductDetailViewProtocol? { get set }
  var interactor: ProductDetailInteractorInputProtocol? { get set}
  var router: ProductDetailRouterProtocol? { get set }
    
  // VIEW -> PRESENTER
  func getProductDescription() -> ProductDetailDescription?
  func getNumberOfItemsAt(_ index: Int) -> Int
    func loadDescriptionData(categoryId : String)
    
  // Show Product Detail Views
    func showProductDescriptionView(for product: Product, from view: UIViewController)
}

protocol ProductDetailInteractorInputProtocol: AnyObject {
  var presenter: ProductDetailInteractorOutputProtocol? { get set}

  // PRESENTER -> INTERACTOR
    func loadDescriptionData(categoryId : String)
  func getNumberOfItemsAt(_ index: Int) -> Int
  func getProductDescription() -> ProductDetailDescription?
    
}

protocol ProductDetailInteractorOutputProtocol: AnyObject {
  // INTERACTOR -> PRESENTER
  func updateDescriptionData()
  func receivedError(_ error: Error)
}

protocol ProductDetailRouterProtocol: AnyObject {
  // PRESENTER -> ROUTER
  func presentProductDescriptionView(for product: ProductDetailDescription, from view: UIViewController)
}
