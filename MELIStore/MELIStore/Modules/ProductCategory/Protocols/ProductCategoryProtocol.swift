//
//  ProductCategoryProtocol.swift
//  MELIStore
//
//  Created by Meli on 10/7/21.
//

import UIKit

// MARK: - VIPER Protocols
protocol ProductCategoryViewProtocol: AnyObject {
  var presenter: ProductCategoryPresenterProtocol? { get set}
    
  // PRESENTER -> VIEW
  func loadCategories()
  func loadCategory()
  func showErrorMessage(_ message: String)
  func showNoInternetErrorMessage(_ message: String)
}

protocol ProductCategoryPresenterProtocol: AnyObject {
  var view: ProductCategoryViewProtocol? { get set }
  var interactor: ProductCategoryInteractorInputProtocol? { get set}
  var router: ProductCategoryRouterProtocol? { get set }
    
  // VIEW -> PRESENTER
  func getItemAt(indexPath: IndexPath) -> CategoryEntity?
  func getItemAtCategory() -> CategoryDetail?
  func getNumberOfItemsAt(_ index: Int) -> Int
  func loadCategoriesData()
  func loadCategoryData(name: String)
  func getProductData()-> Products?
  func getNumberSearchedOfItemsAt(_ index: Int) -> Int
    
  // Show Products List Views
  func showProductListView(for categoryId: String, from view: UIViewController)
  func showProductDetailView(for product: Product, from view: UIViewController)
}

protocol ProductCategoryInteractorInputProtocol: AnyObject {
  var presenter: ProductCategoryInteractorOutputProtocol? { get set}

  // PRESENTER -> INTERACTOR
  func loadCategoriesData()
  func loadCategoryData(name: String)
  func getNumberOfItemsAt(_ index: Int) -> Int
  func getItemAt(_ indexPath: IndexPath) -> CategoryEntity?
  func getItemCategoryAt() -> CategoryDetail?
  func getItemProductsAt() -> Products?
  func getNumberOfSearchedItemsAt(_ index: Int) -> Int
    
}

protocol ProductCategoryInteractorOutputProtocol: AnyObject {
  // INTERACTOR -> PRESENTER
   func updateData()
   func updateCategoryData()
   func receivedError(_ error: Error)
   func noInternetError(_ message: String)
}

protocol ProductCategoryRouterProtocol: AnyObject {
  // PRESENTER -> ROUTER
   func presentProductsView(for categoryId: String, from view: UIViewController)
   func showProductDetailView(for product: Product, from view: UIViewController)
}
