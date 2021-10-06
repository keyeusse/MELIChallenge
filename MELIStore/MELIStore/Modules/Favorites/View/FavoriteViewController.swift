//
//  FavoriteViewController.swift
//  MELIStore
//
//  Created by Meli on 10/6/21.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.idCell, for: indexPath) as! FavoriteTableViewCell
        cell.setUpFavoriteCell(with: favorites[indexPath.row])
        return cell
    }
    

    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    var favorites = [Favorite]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    

    private func setupCollectionView() {
        
        self.favoriteTableView.register(FavoriteTableViewCell.nib(), forCellReuseIdentifier: FavoriteTableViewCell.idCell)
        self.favoriteTableView.dataSource = self
        self.favoriteTableView.rowHeight = UITableView.automaticDimension
        self.favoriteTableView.delegate = self

    }
    
    func setFavorites() {
        
        var highhills = Favorite()                         // Set up
        highhills.name = "Tacones"
        highhills.fees = "36 cuotas"
        highhills.price = "$90.900"
        highhills.image = "highhills"

        var  nails = Favorite()
        nails.name = "Unas"
        nails.fees = "36 cuotas"
        nails.price = "$30.000"
        nails.image = "nails"
        
        var  bagage = Favorite()
        bagage.name = "Maletas"
        bagage.fees = "36 cuotas"
        bagage.price = "$190.900"
        bagage.image = "bagage"
        
        favorites.append(highhills)
        favorites.append(nails)
        favorites.append(bagage)
    }

}
