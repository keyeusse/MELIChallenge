//
//  APIClientMock.swift
//  MELIStoreTests
//
//  Created by Meli on 10/10/21.
//

import Foundation
@testable import MELIStore

class APIClientMock {
  var delegateCategories: APICategoriesResponseProtocol?
    var delegateCategory : APICategoryResponseProtocol?
    var delegateProductsByCategory : APIProductsByCategoryResponseProtocol?
    var delegateProduct : APIProductResponseProtocol?
    var delegateSearchProduct : APISearchProductsResponseProtocol?
    var delegateDescription : APIProductDescriptionResponseProtocol?
}

extension APIClientMock: APIClientProtocol {
    
    //get data test from json files
    func getJsonData(fromJSONFile fileName: String) -> Data? {
        do {
                if let filePath = Bundle.main.path(forResource: fileName, ofType: "json") {
                    let fileUrl = URL(fileURLWithPath: filePath)
                    let data = try Data(contentsOf: fileUrl)
                    return data
                }
            } catch {
                print("error: \(error)")
            }
            return nil
    }
    
    func getProductsSearchList(url: APIServiceUrls, categoryName: String, siteId: APIProductSiteId) {
        let products = Products()
        
        //Get category object for testing api call
        func getProducstForTest(fromJSONFile fileName: String) -> Products? {
            let data = getJsonData(fromJSONFile: fileName) ?? Data()
            //Parsing Data
            let products: Products
            do {
                products = try JSONDecoder().decode(Products.self, from: data)
            } catch {
                return nil
            }
            
            return products
        }
        self.delegateSearchProduct?.getproductSearchResult(data: getProducstForTest(fromJSONFile: "ProductsByCategoryName") ?? products)
    }
    
    func getAllCategoriesList(url: APIServiceUrls, siteId: APIProductSiteId) {
        let categories = [CategoryEntity]()
        
        //Get Categories object for testing api call
        func getCategoriesForTest(fromJSONFile fileName: String) -> [CategoryEntity]? {
            let data = getJsonData(fromJSONFile: fileName) ?? Data()
            //Parsing Data
            let categories: [CategoryEntity]
            do {
                categories = try JSONDecoder().decode([CategoryEntity].self, from: data)
            } catch {
                return nil
            }
            
            return categories
        }
        
        self.delegateCategories?.getCategoriesResult(data: getCategoriesForTest(fromJSONFile: "Categories") ?? categories)
    }
    
    func getCategoryList(url: APIServiceUrls, idCategory: String) {
        
        let category = CategoryDetail()
        
        //Get category object for testing api call
        func getCategoryForTest(fromJSONFile fileName: String) -> CategoryDetail? {
            let data = getJsonData(fromJSONFile: fileName) ?? Data()
            //Parsing Data
            let category: CategoryDetail
            do {
                category = try JSONDecoder().decode(CategoryDetail.self, from: data)
            } catch {
                return nil
            }
            
            return category
        }
        self.delegateCategory?.getCategoryResult(data: getCategoryForTest(fromJSONFile: "Category") ?? category)
    }
    
    func getProductsByCategoryList(url: APIServiceUrls, idCategory: String, siteId: APIProductSiteId) {
        let products = Products()
        
        //Get category object for testing api call
        func getProducstForTest(fromJSONFile fileName: String) -> Products? {
            let data = getJsonData(fromJSONFile: fileName) ?? Data()
            //Parsing Data
            let products: Products
            do {
                products = try JSONDecoder().decode(Products.self, from: data)
            } catch {
                return nil
            }
            
            return products
        }
        self.delegateProductsByCategory?.getProductsByCategoryResult(data: getProducstForTest(fromJSONFile: "ProductsByCategory") ?? products)
    }
    
    func getProductDetail(url: APIServiceUrls, idProduct: String) {
        let product = Product()
        
        //Get category object for testing api call
        func getProductForTest(fromJSONFile fileName: String) -> Product? {
            let data = getJsonData(fromJSONFile: fileName) ?? Data()
            //Parsing Data
            let product: Product
            do {
                product = try JSONDecoder().decode(Product.self, from: data)
            } catch {
                return nil
            }
            
            return product
        }
        self.delegateProduct?.getProductResult(data: getProductForTest(fromJSONFile: "Product") ?? product)
    }

    func getProductDetailDescription(url: APIServiceUrls, productId: String) {
        let productDetail = ProductDetailDescription()
        
        //Get product description object for testing api call
        func getProductDescriptionForTest(fromJSONFile fileName: String) -> ProductDetailDescription? {
            let data = getJsonData(fromJSONFile: fileName) ?? Data()
            //Parsing Data
            let productDetail: ProductDetailDescription
            do {
                productDetail = try JSONDecoder().decode(ProductDetailDescription.self, from: data)
            } catch {
                return nil
            }
            
            return productDetail
        }
        
        self.delegateDescription?.getproductDescription(data: getProductDescriptionForTest(fromJSONFile: "ProductDescription") ?? productDetail)
    }

}
