# MELIChallenge
 Reto propuesto por mercado libre
 
 ### por Key Eusse

## Video
You can find the app video in this link:
https://youtu.be/xkOIrYbuTyI


## Run project

Go to `/MELIStore`. Open a terminal in that route:

//Copy this line in terminal
> pod install

Continue executing line: 
> open MELIStore.xcworkspace

Or, both commands together:

> pod install & open MELIStore.xcworkspace

Finally,  **Build and Run** project MELIStore


# About project

 For developing this project it was neccessary to use some framework:

* Alamofire: To call Api rest services
* SCLAlertView: To show several alertView to manage errors and some information
* SkeletonView: Needed to show animation until data loades
* Codable : To serialize/deserialize API call responses


# MELIStore can do:

    * Search category products from Mercado libre API developers
    * Search products by category
    * See information about product (name, price, available)
    * Add to favorite product list
    * Add to cart sells
    * Buy product


# Architecture

App has a VIPER ARCHITECTURE (clean architecture), for that reason, this is the structrute inside it:

- APIServiceManager: HTTP calls to API to get movie information.

- Resources: There are some classes can help us to manage general styles and text resources

- Views : Contains storyboard 

- Modules: Division for app features.
    * ProductCategory: Load and show all categories of Mercado libre
    * Products: Show and load all products by category
    * Favorites: Show a product favorite list (that list is a static data)
    * ProductDetail: Show information about selected product
    
For VIPER ARCHITECTURE, every module has six folder, this way:
    * View: It contains all module views (Cell, UIViewController, Storyboards)
    * Interactor: It constains all business logic of the module
    * Presenter: Class that orchest all the communication between classes
    * Protocols: Interfaz that has all the contract for presenter communication
    * Entity: Api models
    * Router: It let us to navigate between views
    
    PD: These are the initials of VIPER


# Unit Test
 MELIStore has unit test, to probe every API call. Those can find them in project MELIStoreTest.
 Just play RUN.
 
 The structrure of that:
  * APIClientTest: It contains unit test over API rest calls to Mercado Libre Services.
  * APIClientMocks: It contains methods to mock responses for  API rest calls to Mercado Libre Services.
