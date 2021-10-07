//
//  ViewController.swift
//  MELIStore
//
//  Created by Meli on 10/4/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var catTableView: UITableView!
    
    var categories = [CategoryDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setCategories()
       setupCollectionView()
        // Do any additional setup after loading the view.
    }

    
    private func setupCollectionView() {

        self.catTableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.idCell)
        self.catTableView.dataSource = self
        self.catTableView.rowHeight = UITableView.automaticDimension
        self.catTableView.delegate = self

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.idCell, for: indexPath) as! CategoryTableViewCell
        cell.setUpCell(with: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
   
   
    func setCategories() {
        
        var highhills = CategoryDetail()                         // Set up
        highhills.name = "Tacones"
        highhills.image = "highhills"

        var  nails = CategoryDetail()
        nails.name = "Unas"
        nails.image = "nails"
        
        var  bagage = CategoryDetail()
        bagage.name = "Maletas"
        bagage.image = "bagage"
        categories.append(highhills)
        categories.append(nails)
        categories.append(bagage)
    }

}

