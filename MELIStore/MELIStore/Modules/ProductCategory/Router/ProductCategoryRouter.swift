//
//  ProductCategoryRouter.swift
//  MELIStore
//
//  Created by Meli on 10/7/21.
//

import UIKit

//Class to navegatio between VC
class ProductCategoryRouter: ProductCategoryRouterProtocol {
    func presentProductsView(for item: Products, from view: UIViewController) {
//        guard let productListView = view.storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as? ProductViewController else { return }
//        MovieDetailRouter.createMovieTrailerModule(for: productListView, and: movie)
//        view.navigationController?.pushViewController(detailView, animated: true)
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
  
//  func presentMovieDetailView(for movie: Movie, from view: UIViewController) {
//    guard let detailView = view.storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else { return }
//    MovieDetailRouter.createMovieTrailerModule(for: detailView, and: movie)
//    view.navigationController?.pushViewController(detailView, animated: true)
//  }
    
}
