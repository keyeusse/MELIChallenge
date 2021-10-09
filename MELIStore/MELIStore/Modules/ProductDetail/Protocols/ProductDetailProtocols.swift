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
    func loadProductDetailData(productId : String)
    func produtDetail(productId : String) ->  ProductDetailDescription
}

protocol ProductDetailInteractorInputProtocol: AnyObject {
  var presenter: ProductDetailInteractorOutputProtocol? { get set}

  // PRESENTER -> INTERACTOR
    func loadProductDetailData(productId : String)
    func getProductDetail() -> ProductDetailDescription?
}

protocol ProductDetailInteractorOutputProtocol: AnyObject {
  // INTERACTOR -> PRESENTER
  func updateProductDetailData()
  func receivedError(_ error: Error)
}

protocol ProductDetailRouterProtocol: AnyObject {
  // PRESENTER -> ROUTER
//  func presentProductDetailView(for product: Product, from view: UIViewController)
}
